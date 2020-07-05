class FriendsDetailsController < ApplicationController
  before_action :redirect_to_login
  before_action :set_friend

  def new
    @friends_detail = FriendsDetail.new
  end

  def create
    @friends_detail = @friend.friends_details.build(friends_detail_params)
    @friends_detail.save
    flash[:success] = "追加しました。"
    redirect_to friend_path
  end

    private

      def friends_detail_params
        params.require(:friends_detail).permit(:feature, :content)
      end

      def set_friend
        @friend = Friend.find(params[:id])
      end
end