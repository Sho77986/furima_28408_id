class Item <  ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_one    :addresses
  has_one_attached :image
  #validates :text presence: true

 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
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

  validates :category_id, :item_status_id, :shipping_area_id, :shipping_charge_id, :shipping_day_id,  numericality: { otehr_than: 1 }

end
