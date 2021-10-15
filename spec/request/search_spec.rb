require 'rails_helper'

RSpec.describe 'Search Function', type: :request do
  before do
    sign_in create(:user)
  end

  it 'successfully route to search index' do
    get '/search'
    expect(response).to render_template(:index)
  end

  it 'searches for one ingredient' do
    get '/search'

    post '/search', xhr: true, params: { search: 'eggs' }
    expect(response.code).to eq('200')
  end

  it 'searches for multiple ingredients' do
    get '/search'

    post '/search', xhr: true, params: { search: 'eggs, chicken' }
    expect(response.code).to eq('200')
  end

  it 'searches for ingredients that results to no matches' do
    get '/search'

    post '/search', xhr: true, params: { search: 'bread, chicken' }
    expect(response.code).to eq('200')
  end
end
