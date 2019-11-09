FactoryBot.define  do
  factory :topic, class: Commentui::Topic do
    association :commentable, factory: :game
  end
end
