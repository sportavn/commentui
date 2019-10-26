require "rails_helper"

module Commentui
  RSpec.describe ApplicationController, type: :controller do
    routes { Commentui::Engine.routes }
    let!(:user) { create(:user) }

    before do
      controller.current_user = user
    end

    describe "#check_commentui_user" do
      controller do
        def index
        end
      end
      before do
        controller.current_user = ""
      end
      it do
        get :index
        expect(response.body).to eq({ errors: ["Permission denied"] }.to_json)
      end
    end ###

    describe "#record_not_found" do
      controller do
        def index
          raise ActiveRecord::RecordNotFound
        end
      end
      before do
        controller.current_user = user
      end
      it do
        get :index, params: { id: 123 }
        p response.body
      end
    end ###


    describe do

    end ###
  end ##
end #
