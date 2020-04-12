class ApplicationController < ActionController::Base
        # include DeviseTokenAuth::Concerns::SetUserByToken

  helper_method :minimum_layout?, :minimum_layout!

  before_action :set_host

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end

  def after_sign_in_path_for(resource)
    if user_signed_in?
      flash[:notice] = 'ログインしました。'
      root_path
    else
      home_sign_up_done_path
    end
  end

  def minimum_layout?
    @minimum_layout
  end

  def minimum_layout!
    @minimum_layout = true
  end
end
