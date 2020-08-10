require 'rails_helper'

#RSpec.describe Item, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end


describe Item, type: :model do
  describe '商品新規登録' do
    context '商品新規登録がうまくいくとき' do
      it "nameとuser_id,priceとitem_status_idとshipping_charge_id,
      shipping_area_idとshipping_day_idとcategory_idが存在すれば登録できる" do
       except(@item).to be_valid 
      end

      it "nameが40文字以下で登録できる" do
        @item.name ="aaaaasssssdddddfffffggggghhhhhjjjjjkkkkk"
        except(@item).to be_valid
      end
      it "textが1000文字以下であれば登録できる" do
        except(@item).to be_valid
      end
    end
  
    context '商品新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが40文字以上であれば登録できない" do
        @item.name = "aaabbbcccdddeeefffggghhhiiijjjkkklllmmmnnn"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it "user_idが空では登録できない" do
        @item.user_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("User_id can't be blank")
      end
      it "priceが空では登録できない" do
        @item.price =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "item_status_idが空では登録できない" do
        @item.item_status_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item_status_id can't be blank")
      end
      it "shipping_charge_idが空では登録できない" do
        @item.shipping_charge_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_charege_id can't be blank")
      end
      it "shipping_area_idが空では登録できない" do
        @item.shipping_area_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_area_id can't be blank")
      end
      it "shipping_day_idが空では登録できない" do
        @item.shipping_day_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_day_id can't be blank")
      end
      it "category_idが空では登録できない" do
        @item.user_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
    end
  end
end