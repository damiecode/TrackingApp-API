class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
        before_action :authenticate_user!

        def require_login
          redirect_to '/users/sign_in' unless user_signed_in?
        end
end
