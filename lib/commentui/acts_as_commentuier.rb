require 'active_support/concern'

module Commentui
  module ActsAsCommentuier
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_commentuier
        class_exec do
          has_many :commentui_comments,
                   dependent: :destroy,
                   as: :creator,
                   class_name: "Commentui::Comment"
          has_many :commentui_edited_comments,
                   dependent: :nullify,
                   as: :editor,
                   class_name: "Commentui::Comment"
          has_many :commentui_closed_threads,
                   dependent: :nullify,
                   as: :closer,
                   class_name: "Commentui::Thread"
        end
      end
    end ###
  end ##
end #
