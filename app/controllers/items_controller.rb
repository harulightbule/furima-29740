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


end
