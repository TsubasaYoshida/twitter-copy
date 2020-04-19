FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    body {'エアロビクスしようぜ。'}
  end
end
