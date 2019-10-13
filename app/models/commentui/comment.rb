require_dependency "commentui/application_record"

module Commentui
  class Comment < ApplicationRecord
    belongs_to :thread
    belongs_to :creator, polymorphic: true
    belongs_to :editor, optional: true, polymorphic: true

    validates :content, presence: true

    def as_json(_opts={})
      {
        id: self.id,
        content: self.content,
        created_at: self.created_at,
      }
    end
  end ##
end #
