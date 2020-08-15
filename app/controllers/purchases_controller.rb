class PurchasesController < ApplicationController
  
  before_action :set_item, only:[:index, :create, :pay_item]
  before_action :go_to_index, only: :index
  
  def index # 購入ページ
    @purchase = PurchaseAddress.new # 値が空のPurchaseAddressインスタンスを生成し、インスタンス変数@purchaseに代入
    if current_user.id == @item.user_id # 出品者本人が購入ページに行くことができないようにトップページに戻す
      redirect_to items_path
    end
  end

  def create # 購入するボタンを押した際のアクション
    # @purchaseの中に購入金額とカード情報（token）が入っています。
    @purchase = PurchaseAddress.new(purchase_params)
    # binding.pry
    # @purchaseの値が正常にDBに保存できるかどうかを確認
    if @purchase.valid?
      # もしtrueが返されたら「pay_item」が起動します。
      pay_item
      @purchase.save # 保存（購入）後は、TopPageにリダイレクトする
      return redirect_to root_path
    else
      # falseが返されたら再度indexアクションが起動します。
      render :index
    end
  end
 
  private
 
  def purchase_params # ストロングパラメーター（purchase_addressの）。2つのハッシュを統合するときに使うmergeメソッド。ログイン中のユーザーが持つidを取得するcurrent_userメソッド
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  # これ必要？？？
  def set_item # methodの名前は自由でok
    @item = Item.find(params[:item_id]) # Itemモデルのparamsに含まれているidを、@itemに代入します
  end

  def pay_item
    # 支払い処理コード
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   # PAY.JPテスト秘密鍵を環境変数に入れて呼び込みます
    # 「Chargeオブジェクト」とは、PAY.JP側であらかじめ用意されている支払い情報を生成するオブジェクト
    Payjp::Charge.create(
      amount:  @item.price,    # 商品の値段
      card:    params[:token], # カード情報を受け取るために、PAY.JP側に送るトークン
      currency:'jpy'           # 通貨の種類。jpyは「japanese yen」の略称で「日本円」
    )
  end

  def go_to_index # methodの名前は自由でok
    if @item.purchase != nil # もし商品が売れている場合トップページに戻す
      redirect_to items_path
    end
  end

end