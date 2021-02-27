class Rooms::ChatCard::CommentForm::ComponentReflex < ApplicationReflex
  def comment(room, comment)
    room = Room.find(room)
    Comment.create(user: current_user, body: comment, commentable: room)
  end
end
