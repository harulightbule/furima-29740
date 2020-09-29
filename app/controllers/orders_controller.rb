class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :correct_user, only: :index
  before_action :ban, only: :index

  def index
    @item = Item.find(params[:item_id])
    @item_user_address = ItemUserAddress.new
  end

  def new
    @item_user_address = ItemUserAddress.new
  end

  def create
    @item_user_address = ItemUserAddress.new(item_user_address_params)
    if @item_user_address.valid?
      pay_item
      @item_user_address.save
      redirect_to controller: :items, action: :index
    else
      render :index
    end
  end

  private

  def item_user_address_params
    params.permit(:token, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_user_address_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def correct_user
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end

  def ban
    redirect_to root_path if @item.item_user.present?
  end
end
