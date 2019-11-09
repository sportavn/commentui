require "rails_helper"

module Commentui
  RSpec.describe ActsAsCommentuier, type: :lib do
    let!(:user) { create(:user) }
    let!(:topic) { create(:topic, closer: user) }
    let!(:comment1) { create(:comment, creator: user) }
    let!(:comment2) { create(:comment, creator: user, editor: user) }

    describe "#acts_as_commentuier" do
      it "add methods to ActiveRecord::Base" do
        expect(ActiveRecord::Base).to respond_to(:acts_as_commentuier)
        expect(User).to respond_to(:acts_as_commentuier)
      end

      it "add methods to model acts_as_commentuier" do
        expect(user.commentui_comments).to match_array([comment1, comment2])
        expect(user.commentui_edited_comments).to match_array([comment2])
        expect(user.commentui_closed_topics).to match_array([topic])
      end
    end ###


    describe ".destroy" do
      let!(:comment3) { create(:comment, editor: user) }
      it "destroy all created comments when creator is destroyed" do
        expect {
          user.destroy
        }.to change { Comment.count }.by(-2)
      end

      it "set null editor all edited comments when creator is destroyed" do
        user.destroy
        expect(comment3.reload.editor).to eq(nil)
      end

      it "set null closer all closed topics when creator is destroyed" do
        user.destroy
        expect(topic.reload.closer).to eq(nil)
      end
    end ###
  end ##
end #
