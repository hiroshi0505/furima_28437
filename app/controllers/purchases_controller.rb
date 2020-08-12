class PurchasesController < ApplicationController
  
  before_action :move_to_index, only:[:index, :create, :pay_item]
  before_action :set_item, only:[:index, :create, :pay_item]
  
  def index # 購入ページ
    @purchase = PurchaseAddress.new # 値が空のItemインスタンスを生成し、@itemに代入
  end

  def create # 購入アクション(購入するボタンを押した際のアクション)
    # この@purchaseの中に購入金額とカード情報（token）が入っています。
    @purchase = PurchaseAddress.new(purchase_params)
    # @orderの値が正常にDBに保存できるかどうかを確認
    if @purchase.valid?
      # もしtrueが返されたら「pay_item」が起動します。
      pay_item
      @purchase.save
      # 保存（購入）後は、TopPageにリダイレクトする
      return redirect_to root_path
    else
      # falseが返されたら再度indexアクションが起動します。
      render :index
    end
  end
 
  private
 
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id]) # Itemモデルのparamsに含まれているidを、@itemに代入します
  end

  def pay_item
    # 支払い処理コード
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # PAY.JPテスト秘密鍵を環境変数に入れて呼び込みます
    # 「Chargeオブジェクト」とは、PAY.JP側であらかじめ用意されている支払い情報を生成するオブジェクトです
    #  「Payjp::Charge.create」として、支払い情報を生成しています。
    Payjp::Charge.create(
      amount:  @item.price,    # 商品の値段
      card:    params[:token], # カード情報を受け取るために、PAY.JP側に送るトークンを定義
      currency:'jpy'           # 通貨の種類。jpyは「japanese yen」の略称で「日本円」を意味します。
    )
  end

  def move_to_index # 未ログイン状態のユーザーを転送
    unless user_signed_in?
      redirect_to new_user_session_path # prefixを指定
    # redirect_to '/users/sign_in'      # URI Patternを指定
    end
  end
end
