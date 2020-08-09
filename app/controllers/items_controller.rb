class ItemsController < ApplicationController

  before_action :set_item, only:[:show, :edit, :update]
  
  def index  # Top Pageを表示
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

  def show # 詳細ページに行く
  end

  def edit # 編集ページに行く
  end

  def update # 更新アクション
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :delivery_date_id, :delivery_fee_id, :region_id, :status_id, :price ).merge(user_id: current_user.id)
  end

end