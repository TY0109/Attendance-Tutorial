module SessionsHelper
# 下記のヘルパーメソッドたちを、まとめてmodule化
  
  # ①下記のヘルパーメソッドたちは、sessions_controller.rbに渡す

  # 通常のログイン
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 永続的ログイン
  def remember(user)
    user.remember #Userモデルから②呼び出し→記憶トークンを作成
    # user_idと記憶トークンをcookiesに格納
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 永続的セッションを破棄します
  def forget(user)
    user.forget # Userモデルから④呼び出し→記憶トークンを削除
    # cookies削除
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # セッションと@current_userを破棄します
  def log_out
    forget(current_user) #上述のforgetを呼び出し
    session.delete(:user_id)
    @current_user = nil
  end

  # ②下記のヘルパーメソッドたちは、app_controller.rbに渡されたり、各ビューに渡される

  # 現在のログインユーザーを定義（詳細はプリント見て）
  def current_user
    if (user_id = session[:user_id])
     @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
     user = User.find_by(id: user_id)
     if user && user.authenticated?(cookies[:remember_token]) #authenticated?はUserモデルから③呼び出し
      log_in user
      @current_user = user
     end
    end

  end
  
  # 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
  def current_user?(user)
    user == current_user
  end


  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返します。
  def logged_in?
    !current_user.nil?
  end
  
  # 記憶しているURL(またはデフォルトURL)にリダイレクトします。
  def redirect_back_or(default_url)
    redirect_to(session[:forwarding_url] || default_url)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを記憶します。
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


  
  
end




