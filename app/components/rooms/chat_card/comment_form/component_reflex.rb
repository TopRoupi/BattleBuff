class Rooms::ChatCard::CommentForm::ComponentReflex < ApplicationReflex
  def comment(room, comment)
    morph :nothing

    room = Room.find(room)
    comment = Comment.create(user: current_user, body: comment, commentable: room)

    cable_ready["application-stream"]
      .insert_adjacent_html(
        selector: "#room-#{room.id}-chat",
        html: ApplicationController.render(Rooms::ChatCard::CommentsBox::Comment::Component.new(comment: comment), layout: false)
      )
      .dispatch_event(name: "chats:added")
      .broadcast
  end
end
