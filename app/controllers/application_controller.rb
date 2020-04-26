class ApplicationController < ActionController::Base
  helper_method :minimum_layout?, :minimum_layout!

  # TODO これってprivateでもいいのかも？
  def after_sign_in_path_for(resource)
    if user_signed_in?
      flash[:notice] = 'ログインしました。'
      root_path
    else
      home_sign_up_done_path
    end
  end

  private

  def minimum_layout?
    @minimum_layout
  end

  def minimum_layout!
    @minimum_layout = true
  end

  def set_user
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
