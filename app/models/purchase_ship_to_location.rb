class PurchaseShipToLocation
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_num, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_num, format: {with: /\d{11}/}
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShipToLocation.create(postal_code: postal_code, prefecture_id: prefecture_id,
                          city: city, address: address, building: building,
                          phone_num: phone_num, purchase_id: purchase.id)
  end
end
