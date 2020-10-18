FactoryBot.define do
  factory :item do
      name               {"name"}
      price              {"0000000"}
      description        { Faker::Lorem.paragraph }
      user_id            {"0"}
      category_id        {"0"}
      status_id          {"0"}
      shipping_cost_id   {"0"}
      shipping_timing_id {"0"}
      prefecture_id      {"0"}
  end
end
