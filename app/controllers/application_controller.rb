class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if user_signed_in?
      flash[:notice] = 'ログインしました。'
      home_index_path
    else
      home_sign_up_done_path
    end
  end
end
