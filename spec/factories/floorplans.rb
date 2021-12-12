FactoryBot.define do
  factory :floorplan do
    name { Faker::Address.street_address }
  end
end
