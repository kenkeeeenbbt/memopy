class UsersController < ApplicationController
  before_action :correct_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録に成功しました。"
      redirect_to(user_url(@user.id)) 
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # 正しいユーザーかどうかを確認
    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
end