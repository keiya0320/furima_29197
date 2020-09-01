class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :item_purchase, foreign_key: :product_id, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  VALID_PASSWORD_REGIX = /\A[a-zA-Z0-9]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGIX }
  validates :family_name, presence: true
  validates :first_name, presence: true
  VALID_NAME_REGIX = /\A^[ぁ-んァ-ン一-龥]+$\z/.freeze
  validates :family_name, format: { with: VALID_NAME_REGIX }
  validates :first_name, format: { with: VALID_NAME_REGIX }
  validates :read_family, presence: true
  validates :read_first, presence: true
  VALID_READ_REGIX = /\A^([ァ-ン]|ー)+$\z/.freeze
  validates :read_family, format: { with: VALID_READ_REGIX }
  validates :read_first, format: { with: VALID_READ_REGIX }
  validates :birth, presence: true
end
