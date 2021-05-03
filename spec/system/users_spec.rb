require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do

    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path

      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')

      # 新規登録ページへ移動する
      visit new_user_registration_path

      # ユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      # fill_in 'パスワード（6文字以上）', with: @user.encrypted_password
      # fill_in 'user[password]', with: @user.password
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[time_to_attend]', with: @user.time_to_attend
      find('user[classroom_id]').set(@user.classroom_id)
      fill_in 'user[course_style_id]', with: @user.course_style_id

      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)

      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)

      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    
  end
end
