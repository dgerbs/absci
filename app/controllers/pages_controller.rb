class PagesController < ApplicationController
  def home
    if user_signed_in? 
      @user = current_user
      @protocols = @user.protocols.paginate(page: params[:page])
    end
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