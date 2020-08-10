FactoryBot.define do
  factory :item do
    name                  {"zxcv"}
    text                  {"qwertyuiopasdfghjkl"}
    image                 {"zxcvbnm.png"}
    category_id           {0}
    item_status_id        {0}
    shipping_area_id      {0}
    shipping_charge_id    {0}
    shipping_day_id       {0}
    association :user
  end
end
