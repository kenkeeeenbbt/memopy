class FriendsController < ApplicationController
  before_action :current_user
  before_action :redirect_to_login
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
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
    if @friend.save
      flash[:success] = "友達を追加しました。"
      redirect_to friends_url
    else
      flash.now[:danger] = "失敗しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @friend.update_attributes(friend_params)
      flash[:success] = "更新しました。"
      redirect_to @friend
    else
      flash.now[:danger] = "失敗しました。"
      render 'edit'
    end
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