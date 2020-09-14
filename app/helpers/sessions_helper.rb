module SessionsHelper
  def set_current_user
    return @current_user if @current_user

    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]

    return unless @current_user.nil?

    reset_session
    render json: {
      status: 401,
      error: ['Not logged in!'],
      logged_out: true
    }
  end
end
