module SessionsHelper
  def log_in(user, remember_me = '0')
    if (remember_me == '1')
      remember_token = user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent.signed[:remember_token] = remember_token
    end
    session[:user_id] = user.id
  end

  def current_user
    if @current_user 
      return @current_user
    end

    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find(cookies.signed[:user_id])
      if user.remember_user?(cookies.signed[:remember_token])
        @current_user = User.find_by(id: cookies.signed[:user_id])
        session[:user_id] = user.id
      end
    end

    return @current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    if @current_user
      session.delete(:user_id)
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
      @current_user.forget
      @current_user = nil
    end
  end
end
