class TransactionsController < ApplicationController
  before_action  :move_to_index,  only: [:index]

  def index
    @item = Item.find(params[:item_id]) 
    redirect_to root_path if current_user.id == @item.user_id  ||  Purchase.find_by(item_id: params[:item_id]) != nil
  end

  def create
    @address = AddressPurchase.new(purchase_params)
    if @address.save
      pay_item 
     return redirect_to root_path
    else
        render 'index'
     end
  end

 private
  def move_to_index 
    redirect_to new_user_session_path unless user_signed_in?
  end

  def  purchase_params
    params.permit(:item_id, :postal_code_id, :shipping_area_id, :city_id, :address_id, :building, :call_number).merge(user_id: current_user.id,  item_id: params[:item_id])
  end
  
  def transaction_params
    params.permit(:token)
  end

  def pay_item
    @item_test = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item_test.price,  
      card: params[:token],    
      currency:'jpy'                 
    )
  end
end



