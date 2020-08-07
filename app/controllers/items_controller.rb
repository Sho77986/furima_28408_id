class ItemsController < ApplicationController
  before_action :return_index, except: [:index, :show]
  before_action :set_item, only: [:destroy, :edit, :update, :show]

  def index
    @items = Item.all
  end

  def new
    @item =Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy 
    if @item.destroy
     redirect_to root_path
    else
     render :show
    end 
  end

  #編集と更新はセットで必要
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show  
  end



  private

  def return_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  #作成と編集で必要
  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :text).merge(user_id: current_user.id)
  end

end
