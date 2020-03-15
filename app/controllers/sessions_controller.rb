class SessionsController < ApplicationController
  layout 'auth'

  before_action :anonymous_user, only: [:new, :create]

  before_action :logged_in_user, only: [:delete]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to controller: :home, method: :index
    else
      flash.now[:danger] = 'Invalid email or password'
      render :new
    end
  end

  def delete
    log_out
    redirect_to login_path
  end

  private
    def anonymous_user
      if logged_in?
        redirect_to controller: :home, method: :index
      end
    end
end
