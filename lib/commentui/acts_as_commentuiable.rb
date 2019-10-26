require 'active_support/concern'

module Commentui
  module ActsAsCommentuiable
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_commentuiable
        class_exec do
          has_one :commentui_thread,
                  dependent: :nullify,
                  as: :commentable,
                  class_name: "Commentui::Thread"

          def commentui_thread
            @commentui_thread ||= (super || create_commentui_thread)
          end
        end
      end
    end ###
  end ##
end #
