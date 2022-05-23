class Datespot < ApplicationRecord
  # prefecture_code:integer

  include JpPrefecture
  jp_prefecture :prefecture_code
end
