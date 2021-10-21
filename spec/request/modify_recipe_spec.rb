require 'rails_helper'

RSpec.describe 'Modify Recipe', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user

    get '/recipes/new'

    # no params data since api will fetch all data via id
    new_recipe = { 'recipe' => { 'name' => 'Sample Recipe', 'img_url' => 'https://www.themealdb.com/images/media/meals/n7qnkb1630444129.jpg', 'video_url' => 'https://www.youtube.com/watch?v=v2oCIDFP4oU&list=RDv2oCIDFP4oU&start_radio=1', 'ingredient' => { 'name1' => 'Sample Ingredient 1', 'measurement1' => 'Sample Measurement 1', 'name2' => 'Sample Ingredient 2', 'measurement2' => 'Sample Measurement 2' }, 'instructions' => 'Sample Instruction' } }

    post '/recipes', params: new_recipe
  end

  it 'Modify a recipe' do
    # edited recipe
    edited_recipe = { 'recipe' => { 'name' => 'Sample Recipe Edited', 'img_url' => 'https://www.themealdb.com/images/media/meals/n7qnkb1630444129.jpg', 'video_url' => 'https://www.youtube.com/watch?v=v2oCIDFP4oU&list=RDv2oCIDFP4oU&start_radio=1', 'ingredient' => { 'name1' => 'Sample Ingredient 1 Edited', 'measurement1' => 'Sample Measurement 1 Edited', 'name2' => 'Sample Ingredient 2', 'measurement2' => 'Sample Measurement 2' }, 'instructions' => 'Sample Instruction Edited' } }

    patch "/recipes/#{user.recipes.first.id}", { params: edited_recipe }
    expect(response).to redirect_to("/recipes/#{user.recipes.first.id}")
  end
end
