require_dependency "commentui/application_record"

module Commentui
  class Thread < ApplicationRecord
    belongs_to :commentable, polymorphic: true
    belongs_to :closer, optional: true, polymorphic: true

    has_many :comments, dependent: :destroy
  end ##
end #
