class Item <  ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :addresses
  has_one_attached :image
  #validates :text presence: true
  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  VALID_NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/i

  with_options presence: true do
    validates :name, format: {with: VALID_NAME_REGEX }
    validates :text
    validates :price
  end

  validates :category, :item_status, :shipping_area, :shipping_charge, :shipping_day,  numericality: { otehr_than: 1 }

end
