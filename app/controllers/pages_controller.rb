class PagesController < ApplicationController
  def home
    @user = current_user
   # @protocols = @user.protocols.paginate(page: params[:page])
  end

  def about
  end

  def contact
  end

  def products
  end

  def team
  end
end