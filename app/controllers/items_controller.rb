class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all # controller <= Item model => DB
    @items = Item.order("created_at DESC")
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      render :index
    else
      render :new
    end
   
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

end
