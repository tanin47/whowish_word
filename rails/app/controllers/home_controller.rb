class HomeController < ApplicationController
  
  layout "main"
  
  def edit_nested
    render :edit, :layout=>"nested"
  end
end