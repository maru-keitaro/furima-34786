class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, presence: true,numericality:{ only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999 }
  validates :category_id, numericality: { other_than: 0 } 
  validates :condition_id, numericality: { other_than: 0 } 
  validates :delivery_fee_id, numericality: { other_than: 0 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
  validates :delivery_day_id, numericality: { other_than: 0 } 

  
  belongs_to :user, optional: true
  has_one_attached :image
end
