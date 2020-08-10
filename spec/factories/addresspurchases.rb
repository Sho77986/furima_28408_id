FactoryBot.define do
  factory :addresspurchase do
   #card
    number       { 1234567890123456 }
    cvc          { 0000 }
    exp_year     { 00 }
    exp_month    { 00 }
  
   #address
    item_id          { 0 }
    postal_code_id   {'000-0000'}
    shipping_area_id { 0 }
    city_id          { 'ううう市' }
    address_id       { 'えええ番地' }
    building         { 'おおおビル' }
    call_number      {'09000000000'}
   
  end
end
