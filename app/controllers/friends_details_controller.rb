class FriendsDetailsController < ApplicationController
  before_action :redirect_to_login
  before_action :set_friend, only: [:create]
  before_action :set_friends_detail, only: [:edit, :update, :destroy]

  def new
    @friends_detail = FriendsDetail.new
  end

  def create
    @friends_detail = @friend.friends_details.build(friends_detail_params)
    if @friends_detail.save
      flash[:success] = "追加しました。"
      redirect_to friend_path
    else
      flash.now[:danger] = "失敗しました。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @friends_detail.update_attributes(friends_detail_params)
      flash[:success] = "更新しました。"
      redirect_to @friends_detail.friend
    else
      flash.now[:danger] = "失敗しました。"
      render 'edit'
    end
  end

  def destroy
    @friends_detail.destroy
    flash[:success] = "削除しました。"
    redirect_to @friends_detail.friend
  end

    private

      def friends_detail_params
        params.require(:friends_detail).permit(:feature, :content)
      end

      def set_friend
        @friend = Friend.find(params[:id])
      end

      def set_friends_detail
        @friends_detail = FriendsDetail.find(params[:id])
      end
end