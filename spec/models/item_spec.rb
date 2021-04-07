require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録ができる時' do
      it 'name,description,price,category_id,item_status_id,delivery_charge_id,delivery_area_id,delivery_day_id,price,imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'nameがなければ登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'categoryが空では登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'categoryの1を選択すると登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
    
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'descriptionが空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'item_statusが空では登録できないこと' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status is not a number')
      end

      it 'Item_statusの1を選択すると登録できないこと' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end

      it 'Delivery_chargeがなければ登録できないこと' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end

      it 'Delivery_chargeの1を選択すると登録できないこと' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
      end

      it 'Delivery_area がなければ登録できないこと' do
        @item.delivery_area_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area is not a number')
      end

      it 'Delivery_areaの1を選択すると登録できないこと' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area must be other than 1')
      end

      it 'Delivery_dayがなければ登録できないこと' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day is not a number')
      end

      it 'Delivery_dayの1を選択すると登録できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end

      it 'priceがなければ登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it 'priceが、¥299以下だと登録できないこと' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it 'priceが、¥10,000,000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it 'priceは半角数字でなければ登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは全角文字では登録できないこと' do
        @item.price = '１１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceは英数字混合では登録できないこと' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

    end
  end
end
