require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全てのカラム項目が存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'パスワードが6文字以上であれば登録できること' do
          @user.password = '1a1a1a'
          @user.password_confirmation = '1a1a1a'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@や.がなければ登録できないこと' do
          mail = ['furimafurima.com', 'furima@furimacom']
          mail.each do |m|
            @user.email = m
            @user.valid?
            expect(@user.errors.full_messages).to include('Email is invalid')
          end
        end

        it 'emailが重複していれば登録できないこと' do
          FactoryBot.create(:user, email: 'sample@sample.com', password: '1a1a1a')
          @user.email = 'sample@sample.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが5文字以下では登録できないこと' do
          @user.password = '1a1a1'
          @user.password_confirmation = '1a1a1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordが半角英数字混合出なければ登録できないこと' do
          pw = %w[111111 aaaaaa １a１a１a あaあaあa]
          pw.each do |p|
            @user.password = p
            @user.password_confirmation = p
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end
        end

        it 'family_nameが空では登録できないこと' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'family_nameが英数字では登録できないこと' do
          fam_name = %w[Yamada 000]
          fam_name.each do |n|
            @user.family_name = n
            @user.valid?
            expect(@user.errors.full_messages).to include('Family name is invalid')
          end
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_nameが英数字では登録できないこと' do
          fst_name = %w[Tarou 000]
          fst_name.each do |n|
            @user.first_name = n
            @user.valid?
            expect(@user.errors.full_messages).to include('First name is invalid')
          end
        end

        it 'kana_family_nameが空では登録できないこと' do
          @user.kana_family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana family name can't be blank")
        end

        it 'kana_family_nameが漢字、ひらがな、英数字では登録できないこと' do
          k_fam_name = %w[山田 Yamada 000]
          k_fam_name.each do |n|
            @user.kana_family_name = n
            @user.valid?
            expect(@user.errors.full_messages).to include('Kana family name is invalid')
          end
        end

        it 'kana_first_nameが空では登録できないこと' do
          @user.kana_first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name can't be blank")
        end

        it 'kana_first_nameが漢字、ひらがな、英数字では登録できないこと' do
          k_fam_name = %w[太郎 Tarou 000]
          k_fam_name.each do |_n|
            @user.kana_family_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include('Kana family name is invalid')
          end
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  end
end
