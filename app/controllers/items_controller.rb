class ItemsController < ApplicationController

  before_action :move_to_index, only: :new
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  
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
      render :new # アクション名を指定し、items/new.html.erbにページを戻す。
      # render new_item_path # prefixを指定
    end
  end

  def show # 詳細ページに行く
  end

  def edit # 編集ページに行く
  end

  def update # 更新アクション
    @item.update(item_params)
    if @item.save
      # redirect_to action: :show # アクション名を指定
      redirect_to item_path # prefixを指定
    else
      render action: :edit # アクション名を指定
      # render edit_item_path # prefixを指定
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
    # redirect_to '/users/sign_in' # URI Patternを指定
    redirect_to new_user_session_path # prefixを指定
    end
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :delivery_date_id, :delivery_fee_id, :region_id, :status_id, :price ).merge(user_id: current_user.id)
  end

end