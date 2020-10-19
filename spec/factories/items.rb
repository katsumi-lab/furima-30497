FactoryBot.define do
  factory :item do
      name               {"name"}
      price              {300}
      description        { Faker::Lorem.paragraph }
      category_id        {2}
      status_id          {2}
      shipping_cost_id   {2}
      shipping_timing_id {2}
      prefecture_id      {2}
      association :user
  end
end
