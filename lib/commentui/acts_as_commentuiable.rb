require 'active_support/concern'

module Commentui
  module ActsAsCommentuiable
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_commentuiable
        class_exec do
          has_one :commentui_topic,
                  dependent: :nullify,
                  as: :commentable,
                  class_name: "Commentui::Topic"

          def commentui_topic
            @commentui_topic ||= (super || create_commentui_topic)
          end
        end
      end
    end ###
  end ##
end #
