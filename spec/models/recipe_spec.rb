require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:recipe) do
    described_class.new(
      user_id: user.id,
      name: 'Recipe Test',
      slug: 'Recipe-slug',
      img_url: 'sample_image.jpg',
      instructions: 'recipe instructions',
      video_url: 'https://www.youtube.com/watch?v=h5TvuBzMrlA'
    )
  end

  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is not valid without user id ' do
    recipe.user_id = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without name ' do
    recipe.name = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without slug ' do
    recipe.slug = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without img_url ' do
    recipe.img_url = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without instructions ' do
    recipe.instructions = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without video_url ' do
    recipe.video_url = nil
    expect(recipe).not_to be_valid
  end
end
