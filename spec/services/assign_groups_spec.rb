require 'rails_helper'

RSpec.describe AssignGroups do

  describe '#call' do

    context 'when total team members is less than MIN_SIZE' do
      0.upto(AssignGroups::MIN_SIZE) do |team_size|

        team_members = team_size.times.to_a

        it 'returns a one element array including the team, shuffled' do
          groups = AssignGroups.new.call(team_members)

          expect(groups.size).to eq 1
          expect(groups.first.size).to eq team_size
        end

        it 'shuffles the team_members' do
          expect(team_members).to receive(:shuffle).and_return(team_members)

          AssignGroups.new.call(team_members)
        end
      end
    end

    context 'when total team members is at least MIN_SIZE' do
      AssignGroups::MIN_SIZE.upto(100) do |team_size|

        team_members = team_size.times.to_a

        it 'creates groups that are all between MIN_SIZE and MAX_SIZE' do
          groups = AssignGroups.new.call(team_members)

          groups.each do |group|
            expect(group.size).to be_between(AssignGroups::MIN_SIZE, AssignGroups::MAX_SIZE)
          end
        end

        it 'shuffles the team_members' do
          expect(team_members).to receive(:shuffle).and_return(team_members)

          AssignGroups.new.call(team_members)
        end
      end
    end
  end
end
