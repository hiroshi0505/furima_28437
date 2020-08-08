class ItemsController < ApplicationController

  before_action :move_to_index, only: :new
  
  def index  # Top Pageに行く
    @items = Item.all.order("created_at DESC")
  end

  def new  # 出品ページに行く
    @item = Item.new
  end

  def create  # 保存アクション
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new # items/new.html.erbにページを戻す。
    end
  end

  def show # 商品詳細ページに行く
    @item = Item.find(params[:id])
  end

  private

  def move_to_index
    unless user_signed_in?
    redirect_to '/users/sign_in'
    end
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :delivery_date_id, :delivery_fee_id, :region_id, :status_id, :price ).merge(user_id: current_user.id)
  end

end