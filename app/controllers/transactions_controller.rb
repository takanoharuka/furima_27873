class TransactionsController < ApplicationController
  before_action :set_item

  def index
    if !current_user
      redirect_to ("/users/sign_in")
    elsif @item.user_id == @current_user_id || @item.buyer.present?
      redirect_to root_path
    end
    @transactions = Order.new
  end

  def create
    
    @transaction = Order.new(transactions_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def transactions_params
    params.permit(:token, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transactions_params[:token],
      currency: 'jpy'
    )
  end
end
