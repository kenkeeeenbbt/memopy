class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "ログインに成功しました。"
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to(user_url(user.id))
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが間違っています。"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end

  def new_guest
    user = User.guest
    log_in user
    flash[:success] = "ゲストユーザーとしてログインしました。"
    redirect_to friends_path
  end
end
