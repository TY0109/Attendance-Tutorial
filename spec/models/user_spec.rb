require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前がない場合、無効である" do
    user = User.new(
      name: nil,
      email: "sample@email.com",
      password: "password"
      )
     
    user.valid?
    # 実行結果と期待する結果
    expect(user.errors[:name]).to include("を入力してください")
    # 今回の期待する結果はエラーになることなので、テストが通る
  end

end
