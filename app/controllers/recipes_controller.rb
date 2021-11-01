class RecipesController < ApplicationController
  before_action :check_account_type, only: %i[new create]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    modified_recipe = params[:recipe]
    @recipe = Recipe.find(params[:id])
    @recipe.name = modified_recipe[:name]
    @recipe.slug = modified_recipe[:name].parameterize
    @recipe.img_url = modified_recipe[:img_url]
    @recipe.video_url = parse_youtube_url(modified_recipe[:video_url])
    @recipe.instructions = modified_recipe[:instructions]
    @recipe.ref_id = @recipe.id
    @recipe.save

    if @recipe.save
      # delete all ingredients to create new via edit
      @recipe.ingredients.delete_all
      parse_ingredient_data(modified_recipe[:ingredient_hash]).each do |ingredient|
        @recipe.ingredients.create(
          recipe_id: @recipe.id,
          name: ingredient[0],
          measurement: ingredient[1]
        )
      end
      redirect_to recipe_path(@recipe), success: 'Updated recipe successfully.'
    else
      redirect_back fallback_location: root_path, danger: 'Failed updating recipe. Try again.'
    end
  end

  def create
    new_recipe = params[:recipe]
    @recipe = current_user.recipes.new
    @recipe.name = new_recipe[:name]
    @recipe.slug = new_recipe[:name].parameterize
    @recipe.img_url = new_recipe[:img_url]
    @recipe.video_url = parse_youtube_url(new_recipe[:video_url])
    @recipe.instructions = new_recipe[:instructions]
    # provide dummy ref id
    @recipe.ref_id = 999
    @recipe.save
    # parse_ingredient_data(new_recipe[:ingredient_hash])
    if @recipe.save
      parse_ingredient_data(new_recipe[:ingredient_hash]).each do |ingredient|
        @recipe.ingredients.create(
          recipe_id: @recipe.id,
          name: ingredient[0],
          measurement: ingredient[1]
        )
      end
      redirect_to root_path, success: 'Recipe added to your collection.'
    else
      redirect_back fallback_location: root_path, danger: 'Cannot create recipe. Try again.'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    if @recipe.destroy
      redirect_to root_path, success: 'Recipe deleted successfully.'
    else
      redirect_back fallback_location: root_path, danger: 'Failed to delete recipe.'
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :img_url, :video_url, :instructions, :ref_id)
  end

  def parse_ingredient_data(hash)
    new_arr = []
    hash.each do |_key, val|
      next if val['name'].nil? || val['name'] == '' || val['measurement'].nil? || val['measurement'] == ''

      new_arr << [val['name'], val['measurement']]
    end
    new_arr
  end
end
