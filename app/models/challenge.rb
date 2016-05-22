class Challenge < ActiveRecord::Base
  belongs_to :battle
  has_many :challenge_members
end
