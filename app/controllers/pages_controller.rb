class PagesController < ApplicationController
  def landing_page
    @newsletter = Newsletter.new
  end
end
