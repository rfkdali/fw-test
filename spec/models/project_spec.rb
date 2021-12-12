require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'name' do
    let(:project) { build(:project, name: name) }

    context 'invalid attributes' do
      let(:name) { nil }
      it 'is not valid without a name' do
        expect(project).to_not be_valid
      end
    end
  end
end
