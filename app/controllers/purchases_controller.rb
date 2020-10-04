class PurchasesController < ApplicationController
  before_action :select_item, only: [:index, :create, :pay_item]
  before_action :authenticate_user!

  def index
    if @item.purchase
      redirect_to root_path
    else
      @purchase = PurchaseShipToLocation.new
    end
  end

  def create
    @purchase = PurchaseShipToLocation.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_ship_to_location).permit(:token, :postal_code,
                                                      :prefecture_id, :city,
                                                      :address, :building,
                                                      :phone_num).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end
end
