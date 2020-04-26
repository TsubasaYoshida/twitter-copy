FactoryBot.define do
  factory :tweet do
    association :user, factory: :user_1
    body {'エアロビクスしようぜ。'}
  end
end
