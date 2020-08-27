class Product < ApplicationRecord

  validates :photo, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :postage_type, presence: true
  validates :prefectures, presence: true
  validates :preparation_days, presence: true
  validates :value, presence: true
  validates :value, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  VALID_VALUE_REGIX = /\A[0-9]+\z/i
  validates :value, format: { with: VALID_VALUE_REGIX }

end
