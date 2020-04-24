class FollowsController < ApplicationController
  def create
    current_user.follows << User.find(params[:user_id])
  end
end
