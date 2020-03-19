class HomeController < ApplicationController
  before_action :logged_in_user

  def index
    # cookies.permanent.signed[:toan] = 'hehe'
  end

  def faq
  end
end
