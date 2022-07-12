require 'rails_helper'

RSpec.describe "Users", type: :request do
  user = User.new(
    name: "sample",
    email: "sample@email.com",
    password: "password"
    )

  describe "GET /new" do
    # 上で作成したユーザーがアクセス可能である。
    it "returns http success" do
      get new_user_path
      # 返ってきたレスポンスがhttp接続に成功している
      expect(response).to have_http_status(:success)
    end
  end

  # POSTになっている
  describe "POST /users" do
    it "returns http success" do
      # newアクションから送られてきた値をもたせてあげる
      post users_path, params: { user: { name: "sample", email: "sample@email.com", password: "password" } }
      # :successだとエラーになったので、302に変えた。
      expect(response).to have_http_status(302)
    end
  end


end