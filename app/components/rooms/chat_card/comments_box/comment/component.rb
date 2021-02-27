class Rooms::ChatCard::CommentsBox::Comment::Component < ApplicationComponent
  def initialize(comment:)
    @comment = comment
  end
end
