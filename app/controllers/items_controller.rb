class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(image_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def image_params
    params.require(:item).permit(:image, :name, :information, :price, :category_id, :item_condition_id, :shipping_charge_id, :shipping_area_id, :delivery_date_id).merge(user_id: current_user.id)
  end

end
