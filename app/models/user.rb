class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true
  validates :password, length:{ minimum: 6 }
  validates :password, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, confirmation: true
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/i }
  validates :family_name, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/i }
  validates :first_name_furigana, presence: true
  validates :family_name_furigana, presence: true
  validates :first_name_furigana, format: {with: /\A[ァ-ン]+\z/i }
  validates :family_name_furigana, format: {with: /\A[ァ-ン]+\z/i }
  validates :birthday, presence: true

  has_many :comments
  has_many :items
  has_many :purchases

end
