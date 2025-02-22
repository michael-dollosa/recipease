require 'rails_helper'

RSpec.describe 'Search Show Controller', type: :request do
  before do
    sign_in create(:user)
  end

  it 'Successfully generate page' do
    get '/search/53016'
    expect(response).to render_template(:show)
  end

  it 'Redirects to index page if response has no value' do
    get '/search/12342345345345'
    expect(response).to redirect_to('/search')
  end
end
