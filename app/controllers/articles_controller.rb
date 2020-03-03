class ArticlesController < ApplicationController
  def new
  end

  def create
    render  params
  end
end
