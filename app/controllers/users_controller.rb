class UsersController < ApplicationController
  def index
    @lists = ['haha', 'hehe', 'hihi']
  end

  def new
    @user = UserService.new
    render :new, layout: 'auth'
  end

  def create
    @user = UserService.create(params)

    if @user.valid? then
      UserMailer.account_activation(@user).deliver_now!
      redirect_to login_path
    else
      render :new, layout: 'auth'
    end
  end
end
