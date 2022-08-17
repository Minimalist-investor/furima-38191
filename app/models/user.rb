class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,            presence: true
  validates :password,            presence: true, allow_blank: true
  validates :password,            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_blank: true }
  validates :last_name,           presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :first_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :last_name_kana,      presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :first_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
  validates :birthday,            presence: true

  has_many :items
  has_many :orders
end