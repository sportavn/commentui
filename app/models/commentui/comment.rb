require_dependency "commentui/application_record"

module Commentui
  class Comment < ApplicationRecord
    belongs_to :topic
    belongs_to :creator, polymorphic: true
    belongs_to :editor, optional: true, polymorphic: true

    validates :content, presence: true

    def can_modify?(edited_user)
      edited_user == self.creator
    end

    def as_json(_opts={})
      {
        id: self.id,
        content: self.content,
        updated_at: self.updated_at,
        created_at: self.created_at,
        creator: creator,
        editor: editor,
      }
    end
  end ##
end #
