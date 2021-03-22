class RecordsController < ApplicationController
  before_action :record_create, only: %i[index create]
  before_action :authenticate_user!, only: :index
  def index
    redirect_to root_path if current_user.id == @item.user_id || !@item.record.nil?
    @record_info = RecordInfo.new
  end

  def create
    @record_info = RecordInfo.new(record_params)
    if @record_info.valid?
      pay_item
      @record_info.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def record_create
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_info).permit(:area_id, :adress_number, :city, :building_name, :house_number, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: record_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
