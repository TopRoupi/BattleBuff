class Rooms::ChatCard::CommentForm::Component < ApplicationComponent
  def initialize(room:)
    @room = room
  end
end
