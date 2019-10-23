require 'active_support/concern'

module Commentui
  module ActsAsCommentuiable
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_commentuiable
        has_one :commentui_thread,
                dependent: :nullify,
                as: :commentable,
                class_name: "Commentui::Thread"
      end
    end ###
  end ##
end #
