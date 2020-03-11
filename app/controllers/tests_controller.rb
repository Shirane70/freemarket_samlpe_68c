class TestsController < ApplicationController

  # require 'payjp'
  
  def show
  end

  def done
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
    @items= Items.find(params[:id])
    @items.update( buyer_id: current_user.id)
  end
end