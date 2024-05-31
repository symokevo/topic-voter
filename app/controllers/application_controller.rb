class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  # before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    topics_path
  end

  def require_user
    redirect_to new_user_session_path, alert: "You must be logged in to perform this action." unless user_signed_in?
  end
end
