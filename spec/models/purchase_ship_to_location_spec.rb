require 'rails_helper'

RSpec.describe PurchaseShipToLocation, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_ship_to_location = FactoryBot.build(:purchase_ship_to_location)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@purchase_ship_to_location).to be_valid
    end
    it 'buildingは空でも購入できる' do
      @purchase_ship_to_location.building = nil
      expect(@purchase_ship_to_location).to be_valid
    end
    it 'トークンが空だと購入できない' do
      @purchase_ship_to_location.token = nil
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @purchase_ship_to_location.postal_code = nil
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号の桁が合わないと購入できない' do
      @purchase_ship_to_location.postal_code = '1111-1111'
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '郵便番号にハイフンが含まれていないと購入できない' do
      @purchase_ship_to_location.postal_code = '1111111'
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県が--だと購入できない' do
      @purchase_ship_to_location.prefecture_id = 0
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it '市区町村が空だと購入できない' do
      @purchase_ship_to_location.city = nil
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと購入できない' do
      @purchase_ship_to_location.address = nil
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @purchase_ship_to_location.phone_num = nil
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include("Phone num can't be blank")
    end
    it '電話番号にハイフンが含まれていると購入できない' do
      @purchase_ship_to_location.phone_num = '1111-1111'
      @purchase_ship_to_location.valid?
      expect(@purchase_ship_to_location.errors.full_messages).to include('Phone num is invalid')
    end
  end
end
