require 'rails_helper'

RSpec.describe 'Search Copy Controller', type: :request do
  before do
    sign_in create(:user)
  end

  it 'Successfully copies a recipe' do
    get '/search/53016'

    # no params data since api will fetch all data via id
    post '/search/copy/53016'
    expect(response).to redirect_to('/')
  end

  it 'Redirects to index page if response has no value' do
    get '/search/12342345345345'
    expect(response).to redirect_to('/search')
  end
end
