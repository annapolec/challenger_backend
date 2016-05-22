class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges
end
