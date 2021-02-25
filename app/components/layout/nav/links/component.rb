# frozen_string_literal: true

class Layout::Nav::Links::Component < ApplicationComponent
  def initialize(mobile: false)
    @mobile = mobile
  end
end
