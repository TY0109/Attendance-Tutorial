require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前がない場合、無効である" do
    user = User.new(
      name: nil,
      email: "sample@email.com",
      password: "password"
      )
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("を入力してください")
  end
end
