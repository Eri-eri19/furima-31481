require 'rails_helper'

RSpec.describe RecordAddres, type: :model do
  describe 'create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @record_addres = FactoryBot.build(:record_addres, user_id:user.id, item_id:item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値があれば登録できること' do
        expect(@record_addres).to be_valid
      end

      it 'building_nameがなくても登録できること' do
        @record_addres.building_name = ''
        expect(@record_addres).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeがなければ登録できないこと' do
        @record_addres.postal_code = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにはハイフンが必要であること' do
        @record_addres.postal_code = '1111111'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Postal code はハイフンをつけて入力してください')
      end

      it 'municipalityがなければ登録できないこと' do
        @record_addres.municipality = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street_numberがなければ登録できないこと' do
        @record_addres.street_number = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Street number can't be blank")
      end

      it 'phonenumberがなければ登録できないこと' do
        @record_addres.phonenumber = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it 'phonenumberにハイフンは不要であること' do
        @record_addres.phonenumber = '123-4567-8901'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Phonenumber はハイフンなし、 かつ１２桁以上では登録できません')
      end

      it 'phonenumberは１２桁以上では登録できないこと' do
        @record_addres.phonenumber = '1234567890123'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Phonenumber はハイフンなし、 かつ１２桁以上では登録できません')
      end


      it 'phonenumberは英字のみでは登録できないこと' do
        @record_addres.phonenumber = 'abcdefghijkl'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Phonenumber 半角数字以外では登録できません')
      end

      it 'phonenumberは英数字混合では登録できないこと' do
        @record_addres.phonenumber = '123456abcdef'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Phonenumber 半角数字以外では登録できません')
      end

      it 'phonenumberは全角数字では登録できないこと' do
        @record_addres.phonenumber = '１２３４５６７８９０１２'
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Phonenumber 半角数字以外では登録できません')
      end

      it 'delivery_area_id がなければ登録できないこと' do
        @record_addres.delivery_area_id  = 1
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include('Delivery area must be other than 1')
      end

      it 'tokenが空では登録できないこと' do
        @record_addres.token = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @record_addres.user_id = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @record_addres.item_id = ''
        @record_addres.valid?
        expect(@record_addres.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end