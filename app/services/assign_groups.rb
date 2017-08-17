class AssignGroups
  MIN_SIZE = 3
  MAX_SIZE = 5

  def call(team_members)
    return [team_members.shuffle] if team_members.size < MIN_SIZE

    groups = team_members.shuffle.each_slice(MIN_SIZE).to_a

    last_group = groups.last

    if last_group.size < MIN_SIZE
      groups.pop

      last_group.each_with_index do |team_member, index|
        groups[index % groups.size] << team_member
      end
    end

    groups
  end

end
