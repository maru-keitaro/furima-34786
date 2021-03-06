class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  validates :price, numericality:{ only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end
  
  belongs_to :user
  has_one :order
  has_one_attached :image
end
