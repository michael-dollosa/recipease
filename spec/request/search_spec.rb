require 'rails_helper'

RSpec.describe 'Search Function', type: :request do
  it 'successfully route to search index' do
    get '/searches'
    expect(response).to render_template(:index)
  end

  it 'searches for one ingredient' do
    get '/searches'

    post '/searches', xhr: true, params: { search: 'eggs' }
    expect(response.code).to eq('200')
  end

  it 'searches for multiple ingredients' do
    get '/searches'

    post '/searches', xhr: true, params: { search: 'eggs, chicken' }
    expect(response.code).to eq('200')
  end

  it 'searches for ingredients that results to no matches' do
    get '/searches'

    post '/searches', xhr: true, params: { search: 'bread, chicken' }
    expect(response.code).to eq('200')
  end
end
