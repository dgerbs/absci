class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_search
  
  protected
  
  def set_search
    @search = Antibody.search(params[:q])
    @antibodies = @search.result
  end
end
