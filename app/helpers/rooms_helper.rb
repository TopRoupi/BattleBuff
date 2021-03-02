# frozen_string_literal: true

module RoomsHelper
  def position_to_role(position)
    case position
    when 1
      "hard carry"
    when 2
      "mid lane"
    when 3
      "off lane"
    when 4
      "sup 4"
    when 5
      "sup 5"
    when 6
      "clown"
    end
  end
end
