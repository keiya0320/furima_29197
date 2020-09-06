class OrderInfo < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  VALID_POSTAL_CODE_REGIX = /\A\d{3}[-]\d{4}\z/.freeze
  validates :postal_code, format: { with: VALID_POSTAL_CODE_REGIX }
  VALID_PHONE_NUMBER_REGIX = /\A\d{10,11}\z/.freeze
  validates :phone_number, format: { with: VALID_PHONE_NUMBER_REGIX }
end
