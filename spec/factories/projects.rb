FactoryBot.define do
  factory :project do
    name { Faker::IndustrySegments.sector }
  end
end
