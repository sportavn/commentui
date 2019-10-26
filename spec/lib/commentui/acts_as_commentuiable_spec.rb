require "rails_helper"

module Commentui
  RSpec.describe ActsAsCommentuiable, type: :lib do
    let!(:game) { create(:game) }
    let!(:thread) { create(:thread, commentable: game) }

    describe "#acts_as_commentuiable" do
      let!(:game1) { create(:game) }

      it "add methods to ActiveRecord::Base" do
        expect(ActiveRecord::Base).to respond_to(:acts_as_commentuiable)
        expect(Game).to respond_to(:acts_as_commentuiable)
      end

      it "add methods to model acts_as_commentuable" do
        expect(game.commentui_thread).to eq(thread)
      end

      it "auto create thread for model acts_as_commentuable" do
        expect {
          game1.commentui_thread
        }.to change { Thread.count }.by(1)
        expect(game1.commentui_thread).to eq(Thread.last)
      end
    end  ###

    describe ".destroy" do
      it "set null commentable thread when destroy model acts_as_commentuable" do
        game.destroy
        expect(thread.reload.commentable).to eq(nil)
      end
    end ###
  end ##
end #
