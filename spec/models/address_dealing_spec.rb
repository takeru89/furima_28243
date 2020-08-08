require 'rails_helper'

RSpec.describe AddressDealing, type: :model do
  describe '#create' do
    before do
      @address_dealing = FactoryBot.build(:address_dealing)
    end

    describe '購入者情報' do
      context '購入者情報登録がうまくいくとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@address_dealing).to be_valid
        end

        it 'buildingは空でも保存できること' do
          @address_dealing.building = nil
          expect(@address_dealing).to be_valid
        end
      end

      context '購入者情報登録がうまくいくとき' do
        it 'postal_codeが空だと保存できないこと' do
          @address_dealing.postal_code = nil
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @address_dealing.postal_code = '1234567'
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include('Postal code is invalid. Input numbers and include a hyphen(-).')
        end

        it 'prefectureが空では保存できないこと' do
          @address_dealing.prefecture_id = nil
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("Prefecture can't be blank.")
        end

        it 'prefectureを選択していないと保存できないこと' do
          @address_dealing.prefecture_id = 1
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("Prefecture can't be blank.")
        end

        it 'cityが空だと保存できないこと' do
          @address_dealing.city = nil
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("City can't be blank")
        end

        it 'cityが全角日本語でないと保存できないこと' do
          city = %w[Tokyo 123 １２３]
          city.each do |c|
            @address_dealing.city = c
            @address_dealing.valid?
            expect(@address_dealing.errors.full_messages).to include('City is invalid. Input full-width characters.')
          end
        end

        it 'block_numが空だと保存できないこと' do
          @address_dealing.block_num = nil
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("Block num can't be blank")
        end

        it 'phone_numが空だと保存できないこと' do
          @address_dealing.phone_num = nil
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include("Phone num can't be blank")
        end

        it 'phone_numが半角数字でないと保存できないこと' do
          @address_dealing.phone_num = '０９０１２３４５６７８'
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include('Phone num is invalid. Input 10 or 11 numbers with no hyphens(-)')
        end

        it 'phone_numにハイフンがあると保存できないこと' do
          @address_dealing.phone_num = '090-1234-5678'
          @address_dealing.valid?
          expect(@address_dealing.errors.full_messages).to include('Phone num is invalid. Input 10 or 11 numbers with no hyphens(-)')
        end

        it 'phone_numが、10桁か11桁でなければ保存できないこと' do
          tel = %w[090123456 090123456789]
          tel.each do |t|
            @address_dealing.phone_num = t
            @address_dealing.valid?
            expect(@address_dealing.errors.full_messages).to include('Phone num is invalid. Input 10 or 11 numbers with no hyphens(-)')
          end
        end
      end
    end
  end
end
