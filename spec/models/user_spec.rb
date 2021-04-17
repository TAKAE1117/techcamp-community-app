require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'email, password, nickname, time_to_attend, classroom_id, course_style_idが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字の場合登録できる' do
        @user.password = 'abc123'
        expect(@user).to be_valid
      end

      it 'time_to_attendが数値であれば登録できる' do
        @user.time_to_attend = '123'
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'test.com'
        @user.valid?
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが全角平仮名では登録できない' do
        @user.password = 'あいうえおかきくけこ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角カタカナでは登録できない' do
        @user.password = 'アイウエオカキクケコ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが漢字では登録できない' do
        @user.password = '亜衣上大牡蠣九毛粉'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'time_to_attendが空では登録できない' do
        @user.time_to_attend = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Time to attend can't be blank")
      end

      it 'time_to_attendが全角平仮名では登録できない' do
        @user.time_to_attend = 'あいうえお'
        @user.valid?
      end

      it 'time_to_attendが全角カタカナでは登録できない' do
        @user.time_to_attend = 'アイウエオ'
        @user.valid?
      end

      it 'time_to_attendが漢字では登録できない' do
        @user.time_to_attend = '亜衣上大'
        @user.valid?
      end

      it 'time_to_attendが英字では登録できない' do
        @user.time_to_attend = 'abcde'
        @user.valid?
      end

      it 'classroom_idが0の場合登録できない' do
        @user.classroom_id = 0
        @user.valid?
      end

      it 'course_style_idが0の場合登録できない' do
        @user.course_style_id = 0
        @user.valid?
      end

    end
  end 
end