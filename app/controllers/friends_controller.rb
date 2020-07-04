class FriendsController < ApplicationController
  before_action :current_user
  before_action :redirect_to_login
  before_action :set_friend, only: [:show, :destroy]
  before_action :set_friends_details, only: [:show]

  def index
    @friends = current_user.friends
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

    def set_friends_details
      @friends_details = @friend.friends_details
    end
end