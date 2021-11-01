class PagesController < ApplicationController
  def landing_page
    @newsletter = Newsletter.new
  end

  def error404; end
end
