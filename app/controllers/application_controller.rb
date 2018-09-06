class ApplicationController < ActionController::Base


	def after_sign_in_path_for(resource)
	  user_path(@user)
	end

	def after_sign_out_path_for(resource)
	  new_user_session_path
	end

  before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :user_image, :user_backimage, :user_genre_id])
    end


end
