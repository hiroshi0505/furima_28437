class ItemsController < ApplicationController

  before_action :move_to_index, only: :new
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  
  def index  # Top Pageを表示
    @items = Item.all.order("created_at DESC") # 出品品を降順に並べる
  end

  def new  # 出品ページに行く
    @item = Item.new # 値が空のItemインスタンスを@itemに代入
  end

  def create  # 出品商品をitemsテーブルに保存
    @item = Item.new(item_params) # ストロングパラメーター
    if @item.save
      redirect_to root_path
    else
      render :new # アクションを指定しているため、newのビューが表示されます
    # render new_item_path # prefixを指定
    end
  end

  def show # 詳細ページに行く
  end

  def edit # 編集ページに行く
  end

  def update # 編集内容の更新を行う
    @item.update(item_params) # ストロングパラメーター
    if @item.save
    # redirect_to action: :show # アクション名を指定
      redirect_to item_path # prefixを指定
    else
      render action: :edit # アクションを指定しているため、editのビューが表示されます
    # render edit_item_path # prefixを指定
    end
  end

  def destroy # 削除アクション
    if @item.destroy # 削除アクションが成功した場合
      redirect_to root_path
    else # 削除アクションが失敗した場合（エラーハンドリング）
      render action: :show # アクションを指定しているため、showのビューが表示されます
    end
  end

  private

  def set_item
    @item = Item.find(params[:id]) # Itemモデルのparamsに含まれているidを、@itemに代入します
  end

  def move_to_index # 未ログイン状態のユーザーを転送
    unless user_signed_in?
    # redirect_to '/users/sign_in' # URI Patternを指定
    redirect_to new_user_session_path # prefixを指定
    end
  end
  
  def item_params # ストロングパラメーター（itemモデル）
    params.require(:item).permit(:image, :name, :explanation, :category_id, :delivery_date_id, :delivery_fee_id, :region_id, :status_id, :price ).merge(user_id: current_user.id)
  end

end