class Rooms::ChatCard::CommentsBox::Component < ApplicationComponent
  def initialize(comments:)
    @comments = comments
  end
end
