class  AddressPurchase
  include ActiveModel::Model
  attr_accessor  :postal_code_id, :shipping_area_id,  :city_id,  :address_id,  :building,  :call_number, :item_id, :user_id

  #addressのバリデーション
  VALID_NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/i
  VALID_POSTALNUMBER_REGEX = /\A[0-9]{3}-[0-9]{4}\z/i 
  VALID_CALLNUMBER_REGEX = /\A[0-9]{11}\z/i

  with_options presence: true do
    validates :postal_code_id, format: {with:  VALID_POSTALNUMBER_REGEX }
    validates :city_id,  format: { with: VALID_NAME_REGEX}
    validates :address_id,  format: { with: VALID_NAME_REGEX}
    validates :call_number, format: {with: VALID_CALLNUMBER_REGEX }
  end
  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    address = Address.create(postal_code_id: postal_code_id, city_id: city_id, address_id: address_id, shipping_area_id: shipping_area_id, building: building, call_number: call_number, item_id: item_id) 
    Purchase.create(item_id: item_id, user_id: user_id)
  end

end