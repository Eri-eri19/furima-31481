class ItemsController < ApplicationController
  # before_action :find_items, only: %i[show edit update destroy]
  # before_action :move_to_index, except: %i[index show new create]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
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
  #   item = Item.find(params[:id])
  #   item.destroy
  # end

  # def edit
  #   redirect_to root_path unless @item.record.nil?
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
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  # def find_item
  #   @item = Item.find(params[:id])
  # end

  #   def move_to_index
  #     unless user_signed_in?
  #       redirect_to action: :index
  #     end
  #   end
end
