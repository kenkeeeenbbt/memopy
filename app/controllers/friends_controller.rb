class FriendsController < ApplicationController
  before_action :current_user

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.save
  end

  private

    def friend_params
      params.require(:friend).permit(:name)
    end

    # 現在ログイン中のユーザーを返す (いる場合)
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end
end