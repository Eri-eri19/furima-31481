class ItemsController < ApplicationController
  before_action :move_to_index,  only: [:edit]
  before_action :authenticate_user!, only: [:new, :create,:show]
  before_action :item_for_params, only: [:show, :edit]

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

  def edit
    redirect_to root_path unless @item.record.nil?
  end

  # def update
  #   if @item.update(item_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_for_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @item.user_id || @item.record.present?
  end

end
