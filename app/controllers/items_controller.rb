class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :user_match, only:[:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

def show
end

def edit
end

def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
    @item.destroy
    redirect_to root_path
end

  private

  def item_params
    params.require(:item).permit(:goods, :product, :category_id, :condition_id, :delivery_cost_id, :place_id, :days_to_ship_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end

def set_item
  @item = Item.find(params[:id])
end

def user_match
  unless user_signed_in? && current_user.id == @item.user.id
    redirect_to root_path
end
end