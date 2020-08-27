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
t.text :photo, null: false
t.string :name, null: false
t.text :explanation, null: false
t.integer :category, null: false
t.integer :condition, null:false
t.integer :postage_type, null:false
t.integer :prefectures, null:false
t.integer :preparation_days, null:false
t.integer :value, null:false
t.references :user, foreign_key: true
t.timestamps