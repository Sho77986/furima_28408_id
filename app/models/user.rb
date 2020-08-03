class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  with_options presence: true do
    validates :nickname,  uniqueness: { case_sensitive: true }
    validates :email, uniqueness: true
    validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, length:{ minimum: 6 }
    validates :password, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, confirmation: true
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