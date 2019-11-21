require_dependency "commentui/application_record"

module Commentui
  class Comment < ApplicationRecord
    attr_accessor :preview_children

    has_many :children, class_name: self.name, foreign_key: :parent_id
    belongs_to :parent, class_name: self.name, optional: true

    belongs_to :topic
    belongs_to :creator, polymorphic: true
    belongs_to :editor, optional: true, polymorphic: true

    before_validation :set_topic, if: :child?
    after_save :update_parent_children, if: :child?
    after_destroy :update_parent_children, if: :child?
    validates :content, presence: true

    def can_modify?(edited_user)
      edited_user == self.creator
    end

    def as_json(_opts={})
      {
        id: self.id,
        content: self.content,
        has_children: self.has_children,
        parent_id: parent_id,
        updated_at: self.updated_at,
        created_at: self.created_at,
        creator: creator,
        editor: editor,
      }
    end

    def child?
      self.parent.present?
    end

    private

    def set_topic
      self.topic = self.parent.topic
    end

    def update_parent_children
      return unless self.child?

      if self.saved_change_to_attribute?(:parent_id)
        previous_parent_id = self.attribute_before_last_save(:parent_id)
        previous_parent = Comment.find_by(id: previous_parent_id)
        previous_parent&.update!(has_children: previous_parent&.children&.exists?)
      end
      self.parent.update!(has_children: self.parent.children.exists?)
    end
  end ##
end #
