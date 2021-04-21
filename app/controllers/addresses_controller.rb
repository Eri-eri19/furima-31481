class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_for_params, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @record_addres = RecordAddres.new
  end

  def create
    @record_addres = RecordAddres.new(addresses_params)
    if @record_addres.valid?
      pay_item
      @record_addres.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def addresses_params
    params.require(:record_addres).permit(:postal_code, :street_number, :delivery_area_id, :building_name, :phonenumber, :municipality).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: addresses_params[:token],
      currency: 'jpy'
    )
  end

  def item_for_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.record.present?
  end

end
