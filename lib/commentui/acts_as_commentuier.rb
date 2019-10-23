require 'active_support/concern'

module Commentui
  module ActsAsCommentuier
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_commentuier
        has_many :commentui_comments,
                 dependent: :destroy,
                 as: :creator, class_name: "Commentui::Comment"
        has_many :commentui_edited_comments,
                 as: :editor,
                 class_name: "Commentui::Comment"
        has_many :commentui_closed_threads,
                 as: :closer,
                 class_name: "Commentui::Thread"
      end
    end ###
  end ##
end #
