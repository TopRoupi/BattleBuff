# frozen_string_literal: true

class Tweet < ApplicationRecord
  after_create_commit { broadcast_append_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }
end
