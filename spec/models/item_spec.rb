require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.images = [fixture_file_upload('public/images/test_image.png')]
    end

    describe '商品投稿' do
      context '商品投稿がうまくいくとき' do
        it '全てのカラム項目が存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '商品投稿がうまくいかないとき' do
        it 'imagesがなければ投稿できないこと' do
          @item.images = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Images can't be blank")
        end

        it 'nameが空では投稿できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'introductionが空では投稿できないこと' do
          @item.introduction = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Introduction can't be blank")
        end

        it 'cetegory_idが1では投稿できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'condition_idが1では投稿できないこと' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end

        it 'shippping_payer_idが1では投稿できないこと' do
          @item.shipping_payer_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping payer must be other than 1')
        end

        it 'prefecture_idが1では投稿できないこ' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'shippping_within_idが1では投稿できないこ' do
          @item.shipping_within_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping within must be other than 1')
        end

        it 'priceが300円未満では投稿できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it 'priceが1000万円以上では投稿できないこと' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it 'priceがなければ投稿できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      end
    end
  end
end
