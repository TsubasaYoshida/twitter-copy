FactoryBot.define do
  factory :tweet do
    association :user, factory: :user_1
    body {'エアロビクスしようぜ。'}
  end

  factory :tweet_1, class: Tweet do
    association :user, factory: :user_1
    body {'iPhone欲しいなあ。'}
  end

  factory :tweet_2, class: Tweet do
    association :user, factory: :user_2
    body {'PC欲しいなあ。'}
  end
end
