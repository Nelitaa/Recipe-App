require 'rails_helper'

RSpec.describe Recipe, type: :model do
  user = User.create(name: 'Emmanuel', email: 'abc@abc.com')
  subject do
    Recipe.new(
      name: 'Chicken Masala',
      preparation_unit: 'kg',
      cooking_time: 3,
      description: 'This is how we cook chicken masala',
      public: false,
      user_id: user.id
    )
  end
  before { subject.save }

  it 'Recipe name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Preparation time to be string' do
    expect(subject.preparation_unit).to be_a(String)
  end

  it 'Preparation unit to be kg' do
    expect(subject.preparation_unit).to eql('kg')
  end

  it 'Cooking time to be 10' do
    expect(subject.cooking_time).to eql(3)
  end

  it 'description to be present' do
    expect(subject.description).to eql('This is how we cook chicken masala')
  end

  it 'public is boolean' do
    expect([true, false].include?(subject.public)).to eq(true)
  end
end
