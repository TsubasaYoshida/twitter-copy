FactoryBot.define do
  factory :user_1, class: User do
    id {1}
    screen_name {'tsubasa'}
    name {'Tsubasa'}
    email {'tsubasa@example.com'}
    password {'password'}
  end

  factory :user_2, class: User do
    id {2}
    screen_name {'yoshida'}
    name {'Yoshida'}
    email {'yoshida@example.com'}
    password {'password'}
  end
end
