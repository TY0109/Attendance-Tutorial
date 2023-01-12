source 'https://rubygems.org'

gem 'rails'
gem 'rails-i18n' # 今回はこのgemを追加しています。
gem 'bcrypt'
gem 'faker'
gem 'bootstrap-sass'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'jp_prefecture'
gem 'dotenv-rails'


group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # rspec用に追加
  gem 'rspec-rails'
  # 統合テスト（ログインの有無、フォーム入力の有無、メアドの有無、メアド一意性など)
  gem 'capybara'
  # driver（ブラウザでの挙動確認のonとoff）
  gem 'webdrivers'
  # あらかじめテスト用ユーザー生成
  gem 'factory_bot_rails'

  gem 'webmock'
  gem 'vcr'


end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
