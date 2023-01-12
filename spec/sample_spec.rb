# googleのサーバーに100回アクセスできることのテスト。テストを初めて実行した際に、vcr/vcr_cassetesディレクトリと、その中にget_google.ymlが生成される。

require_relative './spec_helper.rb'
require 'vcr'

RSpec.describe 'sample' do
  it 'sample' do
    VCR.use_cassette("get_google") do
      100.times do
        response = Net::HTTP.get_response(URI('https://www.google.com'))
      end
    end
  end
end
