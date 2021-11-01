class SearchesController < ApplicationController
  before_action :check_account_type, only: [:copy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
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

  def show
    @response = Mealdb::Client.search_by_meal(params[:id])
    if @response[:code] == 404
      redirect_to searches_path, danger: 'Kindy choose among the results.'
    else
      @recipe_hash = validate_video_url((JSON.parse(@response[:body].body))['meals'][0])
      @recipe = {
        name: @recipe_hash['strMeal'],
        thumbnail: @recipe_hash['strMealThumb'],
        ingredients: parse_ingredients_show(@recipe_hash),
        youtube_url: parse_youtube_url(@recipe_hash['strYoutube']),
        instructions: @recipe_hash['strInstructions']
      }
    end
  end

  def copy
    @response = Mealdb::Client.search_by_meal(params[:id])
    @recipe_hash = validate_video_url((JSON.parse(@response[:body].body))['meals'][0])
    @recipe = Recipe.new
    @recipe.ref_id = @recipe_hash['idMeal']
    @recipe.user_id = current_user.id
    @recipe.name = @recipe_hash['strMeal']
    @recipe.slug = @recipe_hash['strMeal'].parameterize
    @recipe.img_url = @recipe_hash['strMealThumb']
    @recipe.video_url = parse_youtube_url(@recipe_hash['strYoutube'])
    @recipe.instructions = @recipe_hash['strInstructions']

    case current_user.recipes.find_by(ref_id: params[:id]).present?
    when true
      redirect_to searches_path, danger: 'You already have an exact copy in your collection. Kindly modify or update it first to avoid duplication.'
    when false
      @recipe.save
      parse_ingredients_create(@recipe_hash).each do |name, value|
        @ingredients = @recipe.ingredients.create(
          recipe_id: @recipe.id,
          name: name,
          measurement: value
        )
      end
      redirect_to root_path, success: 'Recipe added to your collection.'
    else
      redirect_to searches_path, danger: 'Cannot copy recipe. Try again.'
    end
  end

  private

  def parse_ingredients_show(_recipe_hash)
    arr = []
    (1...20).each do |count|
      break if @recipe_hash["strMeasure#{count + 1}"].strip.empty? || @recipe_hash["strMeasure#{count + 1}"].nil?

      arr << "#{@recipe_hash["strMeasure#{count + 1}"]} #{@recipe_hash["strIngredient#{count + 1}"]}"
    end
    arr
  end

  def parse_ingredients_create(_recipe_hash)
    ingredients_hash = {}
    (1...20).each do |count|
      break if @recipe_hash["strMeasure#{count + 1}"].strip.empty? || @recipe_hash["strMeasure#{count + 1}"].nil?

      ingredients_hash[@recipe_hash["strIngredient#{count + 1}"]] = @recipe_hash["strMeasure#{count + 1}"]
    end
    ingredients_hash
  end

  def validate_video_url(hash)
    if hash['strYoutube'].nil? || hash['strYoutube'] == ''
      id = Youtube::Client.search_video("how to cook #{hash['strMeal']}")
      hash['strYoutube'] = "https://www.youtube.com/embed/#{id}"
    end
    hash
  end

  def check_duplicate_copy(id)
    redirect_to searches_path, danger: 'You already have an exact copy in your collection. Kindly modify or update it first to avoid duplication.' unless current_user.recipes.find_by(ref_id: id).nil?
  end
end
