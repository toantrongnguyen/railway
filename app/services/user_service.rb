class UserService
  class << self
    def new
      User.new
    end

    def listAll
      User.order(created_at: :desc).all
    end

    def create(params)
      user_params = get_user_params(params)
      user = User.create(user_params)
    end

    def find(params)
      User.find(params)
    end

    def get_user_params(params)
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
