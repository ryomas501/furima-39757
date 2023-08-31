class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]


  def index
  end

  def new
    @item = Item.new
  end
  
  def create

    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end



  private

  def item_params
    params.require(:item).permit(:goods, :product, :category_id, :condition_id, :delivery_cost_id, :place_id , :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
