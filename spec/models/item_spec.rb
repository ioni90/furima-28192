require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      @item.user_id = FactoryBot.build(:user).id
      expect(@item).to be_valid
    end
    it 'ユーザーが紐付いていないと商品情報は保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it '出品画像が添付されていないと登録ない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空だと登録できない' do
      @item.item_detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item detail can't be blank")
    end
    it '価格が空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が数字以外だと登録できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '価格が300円未満だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end
    it '価格が9,999,999より大きいと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end
    it 'カテゴリーは--で登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it '商品の状態は--で登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it '配送料の負担は--で登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it '発送元の地域は--で登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it '発送までの日数は--で登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
  end
end