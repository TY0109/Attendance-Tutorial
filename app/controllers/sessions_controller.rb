class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # emailでユーザーを見つけ、かつ、そのユーザーのpasswordが、password_digestと一致すれば、
    if user && user.authenticate(params[:session][:password])
      # ログインさせる。つまり、seesion[:user_id]を作成。def log_inは、ヘルパーメソッド
      log_in user
      # チェックが入っていたら、ログイン状態を永続化(def rememberは、ヘルパーメソッド)し、そうでなければ、通常のログイン
      # ログイン状態を永続化とは、つまり、cookies.permanent.signed[:user_id]と、cookies.permanent[:remember_token]を作成
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      # モデルを持たないので、validationに基づいたエラーメッセージが表示されないので、代わりにflash. renderでflashを使うと、ページが変わっても、flashが消えないので、対策として、nowをつけた
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end

  def destroy
    # def log_outは、ヘルパーメソッド
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end


