require "rails_helper"

RSpec.describe Commentui, type: :lib do
  it 'responds to all attributes' do
    expect(Commentui).to respond_to(:base_controller)
    expect(Commentui).to respond_to(:current_user_lambda)
    expect(Commentui).to respond_to(:allow_modify_comment)
    expect(Commentui).to respond_to(:allow_modify_destroy)
  end

  it 'is configurable' do
    c1 = ActionController::API
    c2 = ->(some_controller) { some_controller.current_user }
    Commentui.configure do |config|
      config.base_controller = c1
      config.current_user_lambda = c2
      config.allow_modify_comment = false
      config.allow_modify_destroy = true
    end

    expect(Commentui.base_controller).to eq(c1)
    expect(Commentui.current_user_lambda).to eq(c2)
    expect(Commentui.allow_modify_comment).to eq(false)
    expect(Commentui.allow_modify_destroy).to eq(true)
  end
end #
