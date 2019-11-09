FactoryBot.define  do
  factory :comment, class: Commentui::Comment do
    content { Faker::Lorem.sentence }
    association :topic, factory: :topic
    association :creator, factory: :user
  end
end
