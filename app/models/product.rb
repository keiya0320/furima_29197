class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :item_purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_days

  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :postage_type, presence: true
  validates :prefecture, presence: true
  validates :preparation_days, presence: true
  validates :value, presence: true
  validates :value, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  VALID_VALUE_REGIX = /\A[0-9]+\z/i.freeze
  validates :value, format: { with: VALID_VALUE_REGIX }
end
