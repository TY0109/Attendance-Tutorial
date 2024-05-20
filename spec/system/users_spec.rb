require 'rails_helper'

RSpec.describe User, type: :system do
  # CRUD
  describe 'User CRUD' do
    describe 'ログイン前' do
      describe 'ユーザー新規登録' do
        context 'フォームの入力値が正常' do
          it 'ユーザーの新規作成が成功' do
            # ユーザー新規登録画面へ遷移
            visit signup_path
            # Emailテキストフィールドにtest@example.comと入力。fill_inの値は、ビューのフォームのフィールドのid
            fill_in 'name', with: 'test'
            fill_in 'email', with: 'test@example.com'
            fill_in 'password', with: 'password'
            fill_in 'password_confirmation', with: 'password'
            click_button '新規作成'
            expect(current_path).to eq user_path(User.last)
          end
        end
        
        # FactroryBotでユーザを作成していないためテスト不可
        # context '登録済みメールアドレス' do
        #   it 'ユーザーの新規作成が失敗する' do
        #     visit signup_path
        #     # FactroryBotで既に作成されたユーザーのメアドと重複させる
        #     fill_in 'email', with: user.email
        #     fill_in 'password', with: 'password'
        #     fill_in 'password_confirmation', with: 'password'
        #     click_button '新規作成'
        #     # そのまま新規作成ページにとどまることを期待する
        #     expect(current_path).to eq current_path
        #     expect(page).to have_content "メールアドレスはすでに存在します"
        #   end
        # end
      end
    end
    
    # FactroryBotでユーザを作成していないためテスト不可
    # describe 'ログイン後' do
    #   before { login (user) }
    #   describe 'ユーザー編集' do
    #     context 'フォームの入力値が正常' do
    #       it 'ユーザーの編集が成功' do
    #         visit edit_user_path(user)
    #         fill_in 'email', with:'test@email.com'
    #         fill_in 'password', with: 'password'
    #         fill_in 'password_confirmation', with: 'password'
    #         click_button '更新'
    #         expect(current_path).to eq user_path(user)
    #         expect(page).to have_content 'ユーザー情報を更新しました'
    #       end
    #     end
    #   end
    # end
  end
end
