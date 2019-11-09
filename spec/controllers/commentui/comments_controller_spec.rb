require "rails_helper"

module Commentui
  RSpec.describe CommentsController, type: :controller do
    routes { Commentui::Engine.routes }

    let!(:user) { create(:user) }
    let!(:topic) { create(:topic) }
    let!(:comment1) { create(:comment, topic: topic, creator: user) }
    let!(:comment2) { create(:comment, topic: topic) }
    let!(:comment3) { create(:comment, topic: topic) }

    before do
      controller.current_user = user
    end

    describe "#index" do
      context "default" do
        it do
          get :index, params: { topic_id: topic.id }
          expect(response.body).to eq(topic.comments.includes(:creator, :editor).to_json)
        end
      end

      context "paging" do
        it do
          get :index, params: { topic_id: topic.id, page: 2, items: 1 }
          expect(response.body).to eq(topic.comments.includes(:creator, :editor).offset(1).limit(1).to_json)
        end
      end
    end ###

    describe "#create" do
      context "valid data" do
        it do
          params = {
            topic_id: topic.id,
            comment: {
              content: Faker::Lorem.sentence,
            },
            format: :json,
          }
          expect {
            post :create, params: params
          }.to change { Comment.count }.by(1)
          expect(response.body).to eq(Comment.last.to_json)
        end
      end

      context "content empty" do
        it do
          params = {
            topic_id: topic.id,
            comment: {
              content: nil,
            },
            format: :json,
          }
          expect {
            post :create, params: params
          }.to change { Comment.count }.by(0)
          expect(response.body).to eq({ errors: ["Content can't be blank"] }.to_json)
        end
      end
    end ###

    describe "#update" do
      context "user is the comment creator" do
        it do
          params = {
            topic_id: topic.id,
            id: comment1.id,
            comment: {
              content: Faker::Lorem.sentence,
            },
            format: :json,
          }

          put :update, params: params
          expect(response.body).to eq(comment1.reload.to_json)
        end
      end

      context "user is not the comment creator" do
        it do
          params = {
            topic_id: topic.id,
            id: comment2.id,
            comment: {
              content: Faker::Lorem.sentence,
            },
            format: :json,
          }

          put :update, params: params
          expect(response.body).to eq({ errors: ["Permission denied"] }.to_json)
        end
      end

      context "content empty" do
        it do
          params = {
            topic_id: topic.id,
            id: comment1.id,
            comment: {
              content: "",
            },
            format: :json,
          }

          put :update, params: params
          expect(response.body).to eq({ errors: ["Content can't be blank"] }.to_json)
        end
      end
    end ###

    describe "#destroy" do
      context "user is the comment creator" do
        it do
          params = {
            topic_id: topic.id,
            id: comment1.id,
            format: :json,
          }
          expect {
            delete :destroy, params: params
          }.to change { Comment.count }.by(-1)
          expect(response.body).to eq(comment1.to_json)
        end
      end

      context "user is not the comment creator" do
        it do
          params = {
            topic_id: topic.id,
            id: comment2.id,
            format: :json,
          }
          expect {
            delete :destroy, params: params
          }.to change { Comment.count }.by(0)
          expect(response.body).to eq({ errors: ["Permission denied"] }.to_json)
        end
      end
    end ####
  end ##
end #
