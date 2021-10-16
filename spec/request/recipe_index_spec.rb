require 'rails_helper'

RSpec.describe 'Recipe Index Controller', type: :request do
  before do
    sign_in create(:user)
  end

  it 'Shows index page' do
    get '/recipes'
    expect(response).to render_template(:index)
  end
end
