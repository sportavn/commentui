require 'faker'

FactoryBot.define  do
  factory :comment, class: Commentui::Comment do
    content { Faker::Lorem.sentences }
    association :thread, factory: :thread
    association :creator, factory: :user
  end
end
