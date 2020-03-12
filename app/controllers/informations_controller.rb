class InformationsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]


  def index
    @items = Item.limit(3).order('created_at DESC')
  end

  def show
    @user = User.find(@item.seller_id)
    category_id = @item.category_id
    @category = Category.find(category_id).category_name
  end

  def destroy

    if @item.seller_id == current_user.id
      @item.destroy
    else
      redirect_to information_path
    end

  end

  private

  def item_params
    params.require(:item).permit(:user_id, :seller_id, :buyer_id, :brand_id,:category_id, :description, :state, :postage, :region,:shipping_days, :price, item_categories_attributes:[:id, :category_id],images_attributes: [:id, :image]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end