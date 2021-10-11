class SearchesController < ApplicationController
  def index
    # sample suggestion for user
    @result = Mealdb::Client.search_by_ingredient('chicken breast')
    @recipes = (JSON.parse(@result.body))['meals']
  end

  def create
    @search_str = params[:search]
    # call api
    @result = Mealdb::Client.search_by_ingredient(@search_str)
    @recipes = (JSON.parse(@result.body))['meals']
    respond_to do |format|
      if @result.status == 200
        format.js
      else
        render :index
      end
    end
  end
end
