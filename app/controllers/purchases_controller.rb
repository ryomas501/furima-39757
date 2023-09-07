class PurchasesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @purchase_buyer = PurchaseBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create

    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @purchase_buyer.item_id = params[:item_id]
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:post_code, :place_id, :city, :house_number, :building_name,
                                           :phone_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end
