require 'faker'

FactoryBot.define  do
  factory :thread, class: Commentui::Thread do
    association :commentable, factory: :game
  end
end
