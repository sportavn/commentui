require "rails_helper"

module Commentui
  RSpec.describe Topic, type: :model do
    let!(:game) { create(:game) }
    let!(:topic) { create(:topic, commentable: game) }
    let!(:comment1) { create(:comment, topic: topic) }
    let!(:comment2) { create(:comment, topic: topic) }

    it { expect(topic.valid?).to eq(true) }
    it { expect(topic.commentable).to eq(game) }
    it { expect(topic.comments).to match_array([comment2, comment1]) }

    describe '.destroy' do
      it 'destroy all related comments' do
        expect{
          topic.destroy
        }.to change{ Comment.count }.by(-2)
      end
    end ###
  end ##
end #
