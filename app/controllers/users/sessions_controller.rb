class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def new
    super
  end

  # def create
  #   super
  #   logger.debug
  # end
  def create
    super do |resource|
      if resource.errors.any?
        logger.debug "Authentication failed: #{resource.errors.full_messages.join(', ')}"
      else
        logger.debug "Authentication succeeded for #{resource.email}"
      end
    end
  end

  def destroy
    super
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
