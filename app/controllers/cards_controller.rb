class CardsController < ApplicationController
  
  def index
  end
  
  def remove
    session[:user_proxy] = nil
    redirect_to cards_path
  end
  
end