require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'Belongs to user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'Has many entities' do
    association = described_class.reflect_on_association(:entities)
    expect(association.macro).to eq(:has_many)
  end
end
