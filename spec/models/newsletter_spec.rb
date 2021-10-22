require 'rails_helper'

RSpec.describe Newsletter, type: :model do
  subject(:newsletter) do
    described_class.new(
      email: 'testemail@email.com'
    )
  end

  it 'is valid with valid attributes' do
    expect(newsletter).to be_valid
  end

  it 'is not valid email' do
    newsletter.email = 'asdasdasd@asdasdasd'
    expect(newsletter).not_to be_valid
  end
end
