require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it "全ての項目が存在すれば登録できる" do
          expect(@purchase_address).to be_valid
        end

        it "building_nameが存在しなくても登録できる" do
          @purchase_address.building_name = nil
          @purchase_address.valid?
          expect(@purchase_address).to be_valid
        end
      end
  
      context '商品購入がうまくいかないとき' do
        it "user_idが紐付いていないと商品購入できない" do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include()
        end

        it "item_idが紐付いていないと商品購入できない" do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include()
        end

        it "postal_codeが空だと商品購入できない" do
          @purchase_address.postal_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it "postal_codeに[-]がないと商品購入できない" do
          @purchase_address.postal_code = "1234567"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it "regionが空だと商品購入できない" do
          @purchase_address.region_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
        end

        it "regionの選択が[--]だと商品購入できない" do
          @purchase_address.region_id = '0'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Region can't be blank")
        end

        it "cityが空だと商品購入できない" do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it "street_numberが空だと商品購入できない" do
          @purchase_address.street_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
        end

        it "phone_numberが空だと商品購入できない" do
          @purchase_address.phone_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it "phone_numberが11桁以内でないと商品購入できない" do
          @purchase_address.phone_number = "123456789012"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end
      end
    end
  end
end