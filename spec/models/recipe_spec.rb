require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  subject{
    described_class.new(
      user_id: user.id,
      name: "Recipe Test",
      slug: "Recipe-slug",
      img_url: "https://wwww.tes.com",
      instructions: "recipe instructions",
      video_url: "https://wwww.tes.com"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without user id " do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without name " do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without slug " do
    subject.slug = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without img_url " do
    subject.img_url = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without instructions " do
    subject.instructions = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without video_url " do
    subject.video_url = nil
    expect(subject).to_not be_valid
  end

end