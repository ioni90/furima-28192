class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_detail
    validates :price, numericality: { only_integer: true, 
                                      greater_than: 299, less_than: 10000000 }
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :item_condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_date_id
  end
end
