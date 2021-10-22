require 'rails_helper'

RSpec.describe 'Subscribe to Newsletter', type: :request do
  it 'Subscribes to a newsletter' do
    get '/'
    # no params data since api will fetch all data via id
    newsletter = { 'newsletter' => { 'email' => 'testemail@email.com' } }
    post '/newsletters', params: newsletter

    expect(response).to redirect_to('/')
  end
end
