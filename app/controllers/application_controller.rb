class ApplicationController < ActionController::API
  include ActionController::Helpers
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end


end
