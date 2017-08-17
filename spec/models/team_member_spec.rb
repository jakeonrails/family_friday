require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  describe '#full_name' do
    let(:team_member) {
      build(:team_member, first_name: 'Bob', last_name: 'Jones')
    }

    it 'joins first and last name with a space' do
      expect(team_member.full_name).to eq 'Bob Jones'
    end
  end
end
