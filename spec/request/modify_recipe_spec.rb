require 'rails_helper'

RSpec.describe 'Modify Recipe', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user

    get '/recipes/new'

    # no params data since api will fetch all data via id
    new_recipe = { 'recipe' => { 'name' => 'sample name edited', 'img_url' => 'sample.jpg', 'video_url' => 'https://www.youtube.com/embed/m6jkzIHMEdg', 'ingredient_hash' => { 'ingredient1' => { 'name' => 'sample name 1', 'measurement' => '1111' }, 'ingredient2' => { 'name' => 'sample name 2', 'measurement' => '22222' }, 'ingredient3' => { 'name' => 'sample name 3', 'measurement' => '3333' }, 'ingredient4' => { 'name' => '', 'measurement' => '' } }, 'instructions' => 'sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1' } }

    post '/recipes', params: new_recipe
  end

  it 'Modify a recipe' do
    # edited recipe
    edited_recipe = { 'recipe' => { 'name' => 'sample edited edited', 'img_url' => 'sample.jpg', 'video_url' => 'https://www.youtube.com/embed/m6jkzIHMEdg', 'ingredient_hash' => { 'ingredient1' => { 'name' => 'sample name 1', 'measurement' => '1111' }, 'ingredient2' => { 'name' => 'sample edited 2', 'measurement' => '22222' }, 'ingredient3' => { 'name' => 'sample name 3', 'measurement' => '3333' }, 'ingredient4' => { 'name' => '', 'measurement' => '' } }, 'instructions' => 'sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample edited 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1sample name 1' } }

    patch "/recipes/#{user.recipes.first.id}", { params: edited_recipe }
    expect(response).to redirect_to("/recipes/#{user.recipes.first.id}")
  end
end
