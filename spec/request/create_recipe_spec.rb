require 'rails_helper'

RSpec.describe 'Create Recipe', type: :request do
  before do
    sign_in create(:user)
  end

  it 'Creates a recipe' do
    get '/recipes/new'

    # no params data since api will fetch all data via id
    new_recipe = { 'recipe' => { 'name' => 'Sample Recipe', 'img_url' => 'https://www.themealdb.com/images/media/meals/n7qnkb1630444129.jpg', 'video_url' => 'https://www.youtube.com/watch?v=v2oCIDFP4oU&list=RDv2oCIDFP4oU&start_radio=1', 'ingredient' => { 'name1' => 'Sample Ingredient 1', 'measurement1' => 'Sample Measurement 1', 'name2' => 'Sample Ingredient 2', 'measurement2' => 'Sample Measurement 2' }, 'instructions' => 'Sample Instruction' } }
    post '/recipes', params: new_recipe

    expect(response).to redirect_to('/')
  end
end
