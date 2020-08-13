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
          expect(@item.errors.full_messages).to include("User must exist")
        end

        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "nameが空だと登録できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "explanationが空だと登録できない" do
          @item.explanation = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Explanation can't be blank")
        end

        it "priceが空だと登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "priceの価格が指定範囲内でないと登録できない" do
          @item.price = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end

        it "categoryが空だと登録できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "categoryの選択が[--]だと登録できない" do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "statusが空だと登録できない" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it "statusの選択が[--]だと登録できない" do
          @item.status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it "delivery_feeが空だと登録できない" do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it "delivery_feeの選択が[--]だと登録できない" do
          @item.delivery_fee_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
        end

        it "regionが空だと登録できない" do
          @item.region_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Region can't be blank")
        end
        it "regionの選択が[--]だと登録できない" do
          @item.region_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Region must be other than 0")
        end

        it "delivery_dateが空だと登録できない" do
          @item.delivery_date_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date can't be blank")
        end
        it "delivery_dateの選択が[--]だと登録できない" do
          @item.delivery_date_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
        end
      end
    end
  end
end
