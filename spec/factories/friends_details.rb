FactoryBot.define do
  factory :friends_detail do
    feature { "MyString" }
    content { "MyString" }
    association :friend
  end
end