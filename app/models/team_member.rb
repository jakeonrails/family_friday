class TeamMember < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  scope :available, -> { where(available: true) }

  def full_name
    [first_name, last_name].join(' ')
  end
end
