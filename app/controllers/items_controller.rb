class ItemsController < ApplicationController

  before_action :move_to_index, only: :new
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  
  def index  # Top Pageを表示。@itemsというインスタンス変数に、itemsテーブルのレコードを全て代入
    @items = Item.all.order("created_at DESC") # 降順に並べる
  end

  def new  # 出品ページ
    @item = Item.new # 値が空のItemクラスのインスタンスを生成し、インスタンス変数@itemに代入
  end

  def create  # 出品商品をitemsテーブルに保存
    @item = Item.new(item_params) # ストロングパラメーターで、具体的に保存する事柄を指定
    if @item.save # もし保存できたら
      redirect_to root_path # TopPageに移動
    else # 保存できなければ
      render :new          # new(出品ページ)のビューが表示されます
    # render action: :new  # actionを指定
    # render new_item_path # prefixを指定
    end
  end

  def show # 詳細ページ
  end

  def edit # 編集ページ
  end

  def update # 編集内容の更新
    @item.update(item_params) # ストロングパラメーター
    if @item.save # もし更新を保存できたら
      redirect_to item_path   # prefixを指定 item_pathはshowアクション、items_pathはindexアクション
    # redirect_to action: :show # アクション名を指定
    else # もし更新を保存できなかったら
      render :edit  # アクションを指定しているため、editのビューが表示されます
    # render action: :edit  # アクションを指定しているため、editのビューが表示されます
    # render edit_item_path # prefixを指定
    end
  end

  def destroy # 削除アクション
    if @item.destroy # 削除アクションが成功した場合
      redirect_to root_path
    else # 削除アクションが失敗した場合（エラーハンドリング）
      render action: :show # アクションを指定 詳細ページ（showのビューが表示されます）
    end
  end

  private

  def set_item # methodの名前は自由でok
    @item = Item.find(params[:id]) # Itemモデルのparamsに含まれているidを取得し、インスタンス変数@itemに代入
  end

  def move_to_index # method名は自由
    unless user_signed_in? # 未ログイン状態のユーザーを転送
      redirect_to new_user_session_path # prefixを指定
    # redirect_to '/users/sign_in'      # URI Patternを指定
    end
  end
  
  def item_params # ストロングパラメーター（itemモデル）。2つのハッシュを統合するときに使うmergeメソッド。ログイン中のユーザーが持つidを取得するcurrent_userメソッド
    params.require(:item).permit(:image, :name, :explanation, :category_id, :delivery_date_id, :delivery_fee_id, :region_id, :status_id, :price ).merge(user_id: current_user.id)
  end

end