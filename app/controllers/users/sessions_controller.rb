class Users::SessionsController < Devise::SessionsController

  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.


    def after_sign_out_path_for(_resource_or_scope)
      new_user_session_path
    end
  
    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end

    private

      def check_captcha
        return if verify_recaptcha # verify_recaptcha(action: 'signup') for v3

        self.resource = resource_class.new sign_in_params
        resource.validate # Look for any other validation errors besides reCAPTCHA
        set_minimum_password_length

        respond_with_navigational(resource) do
          flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
          render :new
        end
      end

  end