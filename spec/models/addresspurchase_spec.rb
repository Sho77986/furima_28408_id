require 'rails_helper'

#RSpec.describe Addresspurchase, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end


describe AddressPurchase, type: :model do
  before do
    @address_purchase = FactoryBot.build(:address_purchase)
  end  


  describe '購入情報登録' do
    context '購入情報登録がうまくいくとき' do
       it 'すべての値が正しく入力されていれば保存できること' do
         expect(@address_purchase).to be_valid
       end
       it 'shipping_area_idが{1}以外の時であれば保存できること'do
         expect(@address_purchase).to be_valid
       end
       it "postal_code_idが7桁だと登録できること" do
        expect(@address_purchase).to be_valid
       end 
    end
  
    context '購入情報登録がうまくいかないとき' do
      it "postal_code_idが空だと登録できない" do
        @address_purchase.postal_code_id = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("postal_code_id can't be blank")
      end
      it "postal_code_idが7桁以外だと登録できない" do
        @address_purchase.postal_code_id = '000-00000'or'0000-0000'or'000-000'or'0000-00000'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("postal_code_id is only 7 number")
      end

      it "shipping_area_idが{1}あれば登録できない" do
        @address_purchase.shipping_area_id = {1}
        @AddressPurchase.valid?
        expect(@address_purchase.errors.full_messages).to include("shipping_area_id can't be '--'")
      end
      it "city_idが空では登録できない" do
        @address_purchase.city_id =""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("city_id can't be blank")
      end
      it "address_idが空では登録できない" do
        @address_purchase.address_id =""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("address_id can't be blank")
      end
     
      it "call_numberが空では登録できない" do
        @address_purchase.shipping_charge_id =""
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("call_number can't be blank")
      end
      it "call_numberが11桁を越えれば登録できない" do
        @address_purchase.call_number ="123456789012"
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("call_number is too long (maximum is 11 number")
      end
    end
  end
end