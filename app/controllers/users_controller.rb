class UsersController < ApplicationController
  def new
    redirect_to root_path if current_user
  end
end
