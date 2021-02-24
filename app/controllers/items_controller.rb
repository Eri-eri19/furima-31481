class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: %i[show edit update destroy]
  before_action :move_to_index, except: %i[index show new create]

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  #   tweet = Tweet.find(params[:id])
  #   tweet.destroy
  # end

  # def edit
  #   redirect_to root_path unless @item.order.nil?
  # end

  # def update
  #   if @item.update(item_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  # def show
  # end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :money_type_id, :area_id, :send_day_id, :price, :image).merge(user_id: current_user.id)
  end

  # def find_item
  #   @item = Item.find(params[:id])
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
