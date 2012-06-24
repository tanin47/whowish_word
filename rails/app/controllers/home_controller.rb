class HomeController < ApplicationController
  
  layout "main"

  def index

  end
  
  def edit_nested
    render :edit, :layout=>"nested"
  end
end