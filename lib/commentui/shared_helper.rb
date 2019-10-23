module Commentui
  module SharedHelper
    def commentui_user
      @commentui_user ||= Commentui.current_user_lambda.call(self)
    end
  end ##
end #
