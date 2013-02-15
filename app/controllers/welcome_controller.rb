class WelcomeController < ApplicationController
  before_filter :setup_nav

  def index
  end

  def setup_nav
    @home_page = true
  end

end
