class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    new_recipe = params[:recipe]
    @recipe = current_user.recipes.new
    @recipe.name = new_recipe[:name]
    @recipe.slug = new_recipe[:name].parameterize
    @recipe.img_url = new_recipe[:img_url]
    @recipe.video_url = new_recipe[:video_url]
    @recipe.instructions = new_recipe[:instructions]
    @recipe.save

    if @recipe.save
      parse_ingredient_data(new_recipe[:ingredient]).each do |name, measurement|
        @recipe.ingredients.create(
          recipe_id: @recipe.id,
          name: name,
          measurement: measurement
        )
      end
      redirect_to root_path, success: 'Recipe added to your collection.'
    else
      redirect_back fallback_location: root_path, danger: 'Cannot create recipe. Try again.'
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :img_url, :video_url, :instructions)
  end

  def parse_ingredient_data(hash)
    new_hash = {}
    count = 0
    hash.each do |key, _val|
      next if key == "measurement#{count + 1}"
      break if hash["name#{count + 1}"].nil? || hash["name#{count + 1}"] == ''

      new_hash[hash["name#{count + 1}"]] = hash["measurement#{count + 1}"]
      count += 1
    end
    puts "ingredient hash: #{new_hash}"
    new_hash
  end
end
