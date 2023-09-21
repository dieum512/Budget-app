require 'rails_helper'

RSpec.describe User, type: :model do
    it 'Has many entities' do
        association = described_class.reflect_on_association(:entities)
        expect(association.macro).to eq(:has_many)
    end

    it 'Has many groups' do
        association = described_class.reflect_on_association(:groups)
        expect(association.macro).to eq(:has_many)
    end
end