class FriendsController < ApplicationController
  before_action :current_user
  before_action :set_friend, only: [:show, :destroy]
  before_action :redirect_to_login
  before_action :correct_friend, only: [:show, :destroy]

  def index
    user = User.find(current_user.id)
    @friends = user.friends
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = current_user.friends.build(friend_params)
    @friend.save
    flash[:success] = "人物を追加しました。"
    redirect_to friends_url
  end

  def destroy
    @friend.destroy
    flash[:success] = "削除しました。"
    redirect_to friends_url
  end

  private

    def friend_params
      params.require(:friend).permit(:name, :user_id)
    end

    def set_friend
      @friend = Friend.find(params[:id])
    end

    def correct_friend
      unless @friend.user_id == current_user.id
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
end