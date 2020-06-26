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
      params.require(:friend).permit(:name, :user_id)
    end
end