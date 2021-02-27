class Rooms::ChatCard::CommentsBox::Component < ApplicationComponent
  def initialize(comments:, room:)
    @comments = comments
    @room = room
  end
end
