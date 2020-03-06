class UsersController < ApplicationController
  def index
    @user = User.create(name: 'toan', password: '12345', email: 't2est')
    render json: { status: @user.valid? }
  end
end
