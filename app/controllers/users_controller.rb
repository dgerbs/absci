class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @protocols = @user.protocols.paginate(page: params[:page])
  end
end
