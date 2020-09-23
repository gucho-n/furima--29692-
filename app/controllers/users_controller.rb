class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
  @user = Users.
  # //やばい、クリエイトの作り方がわからない
  end
end
