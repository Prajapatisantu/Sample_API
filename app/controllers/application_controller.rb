class ApplicationController < ActionController::Base
		# skip_before_action :verify_authenticity_token
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:password_confirmation, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,:password_confirmation, :current_password)}
    end


		# def authenticate_request
		# 	@current_user = AuthorizeApiRequest.call(request.headers).result
		# 	render json: { error: 'Not Authorized' }, status: 401 unless @current_user
		# end
end
