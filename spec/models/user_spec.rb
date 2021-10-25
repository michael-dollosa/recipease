require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    described_class.new(
      email: 'testemail@email.com',
      username: 'testemail',
      password: 'test12345'
    )
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without username' do
    user.username = nil
    expect(user).not_to be_valid
  end
end
