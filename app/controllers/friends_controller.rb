class FriendsController < ApplicationController
  before_action :current_user
  before_action :set_friend, only: [:show, :destroy]

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
    redirect_to friends_url
  end

  def destroy
    @friend.destroy
    redirect_to friends_url
  end

  private

    def friend_params
      params.require(:friend).permit(:name, :user_id)
    end

    def set_friend
      @friend = Friend.find(params[:id])
    end
end