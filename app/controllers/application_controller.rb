class ApplicationController < ActionController::Base

    protect_from_forgery prepend: true



	def after_sign_in_path_for(resource)
	  top_path
	end

	def after_sign_out_path_for(resource)
	  sign_path
	end

    before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :user_image, :user_backimage, :user_genre_id])
    end

end
