require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it "全ての項目が存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end
  
      context '商品出品がうまくいかないとき' do
        it "ユーザーが紐付いていないと商品出品はできない" do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Userを入力してください")
        end

        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("出品画像を入力してください")
        end

        it "nameが空だと登録できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end

        it "explanationが空だと登録できない" do
          @item.explanation = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の説明を入力してください")
        end

        it "priceが空だと登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("価格を入力してください")
        end
        it "priceの価格が指定範囲内でないと登録できない" do
          @item.price = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("価格は¥300〜9,999,999円の範囲内で入力して下さい")
        end

        it "categoryが空だと登録できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Categoryを入力してください")
        end
        it "categoryの選択が[--]だと登録できない" do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("カテゴリーは「--」以外を選択して下さい")
        end

        it "statusが空だと登録できない" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Statusを入力してください")
        end
        it "statusの選択が[--]だと登録できない" do
          @item.status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品の状態は「--」以外を選択して下さい")
        end

        it "delivery_feeが空だと登録できない" do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery feeを入力してください")
        end
        it "delivery_feeの選択が[--]だと登録できない" do
          @item.delivery_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("配送料の負担は「--」以外を選択して下さい")
        end

        it "regionが空だと登録できない" do
          @item.region_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Regionを入力してください")
        end
        it "regionの選択が[--]だと登録できない" do
          @item.region_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元の地域は「--」以外を選択して下さい")
        end

        it "delivery_dateが空だと登録できない" do
          @item.delivery_date_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery dateを入力してください")
        end
        it "delivery_dateの選択が[--]だと登録できない" do
          @item.delivery_date_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("発送までの日数は「--」以外を選択して下さい")
        end
      end
    end
  end
end