class ItemsController < ApplicationController
  def index
    @image = Image.find(1)
  end

  def new
    @item = Item.new  
    @item.images.build
    @parents = Category.all.order("id ASC").limit(13)
    # @item.build_images
  end

  def create
    # Team.create(item_params)
    @item = Item.new(item_params)
    if @item.save
      # flash[:success] = "商品を登録しました"
      # session[:user_id] = @user.id # ログイン状態維持のためuser_idをsessionに保存
      
      render 'index'
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to informations_path
    else
      render '#' unless @item.valid?
    end
  end

  private
  # def set_items
  #   @items = Item.find(params[:user_id])
  # end
  def item_params
    params.require(:item).permit(
      :brand, 
      :name, 
      :description, 
      :state, 
      :postage, 
      :region, 
      :shipping_days, 
      :price, 
      images_attributes: [:id, :image],
      categories_ids: []
    ).merge(seller_id: current_user.id)
  end
end