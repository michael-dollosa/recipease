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

  it 'cannot copy duplicate' do
    get '/search'

    # no params data since api will fetch all data via id
    post '/search/copy/53035'
    post '/search/copy/53035'
    expect(response).to redirect_to('/search')
  end

  # it 'cannot copy more than 20 for free trier' do
  #   get '/search'

  #   post '/search/copy/53016'
  #   post '/search/copy/53017'
  #   post '/search/copy/53018'
  #   post '/search/copy/53019'
  #   post '/search/copy/53020'
  #   post '/search/copy/53021'
  #   post '/search/copy/53022'
  #   post '/search/copy/53023'
  #   post '/search/copy/53024'
  #   post '/search/copy/53025'
  #   post '/search/copy/53026'
  #   post '/search/copy/53027'
  #   post '/search/copy/53028'
  #   post '/search/copy/53029'
  #   post '/search/copy/53030'
  #   post '/search/copy/53031'
  #   post '/search/copy/53032'
  #   post '/search/copy/53033'
  #   post '/search/copy/53034'
  #   post '/search/copy/53035'
  #   post '/search/copy/53036'
  #   post '/search/copy/53037'
  #   expect(response).to redirect_to('/search')
  # end
end
