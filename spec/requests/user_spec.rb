require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get new_user_path
      # 返ってきたレスポンスがhttp接続に成功している
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /users" do
    it 'ユーザーが新規作成される' do
      expect {
        post users_path,
          params: {
            user: {
              name:                  'sample',
              email:                 'sample@email.com',
              password:              'password',
              password_confirmation: 'password'
            }
          }
      }.to change(User, :count).by(1)
    end
  end
end
