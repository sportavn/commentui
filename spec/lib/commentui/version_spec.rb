require "rails_helper"

module Commentui
  RSpec.describe VERSION, type: :lib do
    it { expect(VERSION).to eq("0.1.0") }
  end
end
