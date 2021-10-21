require 'rails_helper'

RSpec.describe 'Create Recipe', type: :request do
  before do
    sign_in create(:user)
  end

  it 'Creates a recipe' do
    get '/recipes/new'

    # no params data since api will fetch all data via id
    new_recipe = { 'recipe' => { 'name' => 'sample name edited', 'img_url' => 'sample.jpg', 'video_url' => 'https://www.youtube.com/embed/m6jkzIHMEdg', 'ingredient_hash' => { 'ingredient1' => { 'name' => 'sample name 1', 'measurement' => '1111' }, 'ingredient2' => { 'name' => 'sample name 2', 'measurement' => '22222' }, 'ingredient3' => { 'name' => 'sample name 3', 'measurement' => '3333' }, 'ingredient4' => { 'name' => '', 'measurement' => '' } }, 'instructions' => 'sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1' } }
    post '/recipes', params: new_recipe

    expect(response).to redirect_to('/')
  end
end
