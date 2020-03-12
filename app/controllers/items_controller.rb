class ItemsController < ApplicationController
  before_action :set_item ,only: [:pay]

  def index
    @image = Image.find(1)
  end

  def new
    @item = Item.new  
    @item.images.build
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

  def show
    @item = Item.find(params[:id])
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

  def pay
    Payjp.api_key = 'sk_test_9c5b009b4c2db8f24416cfd2'
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
    @item.update( buyer_id: current_user.id)
    redirect_to done_items_path
  end

  def done
  end

  private
  # def set_items
  #   @items = Item.find(params[:user_id])
  # end
  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(
      :brand, 
      :category_id, 
      :name, 
      :description, 
      :state, 
      :postage, 
      :region, 
      :shipping_days, 
      :price, 
      :text,
      images_attributes: [:id, :image]
    ).merge(seller_id: current_user.id)
  end
end