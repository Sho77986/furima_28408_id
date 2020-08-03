class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,  uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :first_name, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/i }
    validates :family_name, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/i }
    validates :first_name_furigana, format: {with: /\A[ァ-ン]+\z/i }
    validates :family_name_furigana, format: {with: /\A[ァ-ン]+\z/i }
    validates :birthday
  end

   has_many :comments
   has_many :items
   has_many :purchases
  
end