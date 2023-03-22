require 'rails_helper'

RSpec.describe Food, type: :model do
  user1 = User.create(name: 'Marianela', email: 'abc@abc.com')
  subject do
    Food.new(
      name: 'Pizza',
      measurement_unit: 'kg',
      price: 12.2,
      quantity: 10,
      user_id: user1.id
    )
  end
  before { subject.save }

  it 'Food name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'measurement unit to be string' do
    expect(subject.measurement_unit).to be_a(String)
  end

  it 'Quantity to be 10' do
    expect(subject.quantity).to eql(10)
  end

  it 'Food price should be 12.2' do
    expect(subject.price).to be_a(Float)
  end
end
