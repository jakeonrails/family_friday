class GroupsController < ApplicationController
  def index
    @groups = AssignGroups.new.call(TeamMember.all.to_a)
  end
end
