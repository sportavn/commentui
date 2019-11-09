require "rails_helper"

module Commentui
  RSpec.describe VERSION, type: :lib do
    it { expect(VERSION).to eq("0.2.0") }
  end
end
