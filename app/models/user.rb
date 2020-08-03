class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i 
  VALID_NAME_REGEX = /\A[ぁ-んァ-ンー-龥]+\z/i
  VALID_FURIGANA_REGEX =  /\A[ァ-ン]+\z/i 

  with_options presence: true do
    validates :nickname,  uniqueness: { case_sensitive: true }
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :first_name, format: {with: VALID_NAME_REGEX }
    validates :family_name, format: {with: VALID_NAME_REGEX }
    validates :first_name_furigana, format: {with: VALID_FURIGANA_REGEX } 
    validates :family_name_furigana, format: {with: VALID_FURIGANA_REGEX }
    validates :birthday
  end

   has_many :comments
   has_many :items
   has_many :purchases
  
end