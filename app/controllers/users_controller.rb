class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /configs
  def me
    render json: @current_user
  end
end
