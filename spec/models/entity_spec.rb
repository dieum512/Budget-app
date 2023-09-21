require 'rails_helper'

RSpec.describe Entity, type: :model do
    it 'Belongs to user' do
        association = described_class.reflect_on_association(:user)
        expect(association.macro).to eq(:belongs_to)
    end

    it 'Belongs to group' do
        association = described_class.reflect_on_association(:group)
        expect(association.macro).to eq(:belongs_to)
    end
end