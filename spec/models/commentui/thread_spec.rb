require "rails_helper"

module Commentui
  RSpec.describe Thread, type: :model do
    let!(:game) { create(:game) }
    let!(:thread) { create(:thread, commentable: game) }
    let!(:comment1) { create(:comment, thread: thread) }
    let!(:comment2) { create(:comment, thread: thread) }

    it { expect(thread.valid?).to eq(true) }
    it { expect(thread.commentable).to eq(game) }
    it { expect(thread.comments).to match_array([comment2, comment1]) }

    describe '.destroy' do
      it 'destroy all related comments' do
        expect{
          thread.destroy
        }.to change{ Comment.count }.by(-2)
      end
    end ###
  end ##
end #
