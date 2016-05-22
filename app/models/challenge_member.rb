class ChallengeMember < ActiveRecord::Base
  belongs_to :challenge_member, polymorphic: true
  belongs_to :challenge
end