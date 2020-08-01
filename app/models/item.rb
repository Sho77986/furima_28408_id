class Item < ApplicationRecord
  belongs_to :users
  has_many   :comments
  has_one    :addresses
end
