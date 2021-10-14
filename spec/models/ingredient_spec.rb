require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:recipe) { create(:recipe) }
  subject {
    described_class.new(
      recipe_id: recipe.id,
      name: "test ingredient",
      measurement: "1/2 tbs"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without recipe id " do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without name id " do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without measurement " do
    subject.measurement = nil
    expect(subject).to_not be_valid
  end

end