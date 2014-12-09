# This is the home controller. It controls the index page.
class HomeController < ApplicationController

  def index
    @w = Weather.query
  end

end
