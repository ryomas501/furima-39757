class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  
  def index
    user_check
    unless @item.purchase.present? 
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_buyer = PurchaseBuyer.new
    else
      redirect_to root_path
  end
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @purchase_buyer.item_id = params[:item_id]
    if @purchase_buyer.valid?
      pay_item
      @purchase_buyer.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:post_code, :place_id, :city, :house_number, :building_name,
                                           :phone_number, :user_id, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_check
    if current_user.id == @item.user.id
      redirect_to root_path
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end
end