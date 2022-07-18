class User < ApplicationRecord
  has_many :attendances, dependent: :destroy

  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
                    
  validates :department, length: { in: 2..30 }, allow_blank: true
  validates :basic_time, presence: true
  validates :work_time, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  # 暗号化。渡されたパスワードの文字列のハッシュ値を返します。②で呼び出される。
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end

  # ①トークン作成。ランダムなトークンを返します。
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # ②記憶トークン化し、DBに保存(永続セッションのためハッシュ化したトークンをデータベースに記憶します。)
  # seesionsヘルパー内で呼び出される
  def remember
    self.remember_token = User.new_token
    # 暗号化し、remember_digestカラムに保存
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # ③記憶トークンの認証(cookiesの中に保存されている記憶トークンが、remember_digestに保存されている記憶トークンと一致することを確認)
  # sessionsヘルパーで呼び出される
  def authenticated?(remember_token)
   # 複数のブラウザ対応（詳細はプリント見て）
   return false if remember_digest.nil?
   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ④記憶トークンを破棄します。
  # sessionsヘルパーで呼び出される
  def forget
    update_attribute(:remember_digest, nil)
  end


end



