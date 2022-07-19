require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it 'create a weapon' do
    weapon = build(:weapon)
    expect(weapon).to be_valid
  end

  it 'it is invalid if level over than 99' do
    weapon = build(:weapon, level: FFaker::Random.rand(100..9000))
    expect(weapon).to_not be_valid
  end
end
