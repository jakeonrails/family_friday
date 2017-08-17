class GroupsController < ApplicationController
  def index
    @groups = AssignGroups.new.call(TeamMember.available.all.to_a)
  end
end
