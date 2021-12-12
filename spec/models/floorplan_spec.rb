require 'rails_helper'

RSpec.describe Floorplan, type: :model do
  describe 'name' do
    let(:floorplan) { build(:floorplan, name: name) }

    context 'invalid attributes' do
      let(:name) { nil }
      it 'is not valid without a name' do
        expect(floorplan).to_not be_valid
      end
    end
  end
end
