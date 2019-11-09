require "rails_helper"

module Commentui
  RSpec.describe Comment, type: :model do
    let!(:topic) { create(:topic) }
    let!(:creator) { create(:user) }
    let!(:another_user) { create(:user) }
    let!(:comment) { create(:comment, topic: topic, creator: creator, editor: creator) }

    describe '#create' do
      it { expect(comment.valid?).to eq(true) }
      it { expect(comment.topic).to eq(topic) }
      it { expect(comment.creator).to eq(creator) }
      it { expect(comment.editor).to eq(creator) }

      context "content empty" do
        before do
          comment.content = ""
        end
        it { expect(comment.valid?).to eq(false) }
      end
    end ###

    describe ".can_modify?" do
      context "editor is the same as creator" do
        it { expect(comment.can_modify?(creator)).to eq(true) }
      end

      context "editor is NOT the same as creator" do
        it { expect(comment.can_modify?(another_user)).to eq(false) }
      end
    end ###

    describe ".as_json" do
      it do
        expected = {
          id: comment.id,
          content: comment.content,
          updated_at: comment.updated_at,
          created_at: comment.created_at,
          creator: comment.creator,
          editor: comment.editor,
        }
        expect(comment.as_json).to eq(expected)
        expect(comment.to_json).to eq(expected.to_json)
      end
    end ###
  end ##
end #
