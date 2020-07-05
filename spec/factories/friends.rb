FactoryBot.define do
  factory :friend do
    name { "MyString" }
    association :user
  end
end
