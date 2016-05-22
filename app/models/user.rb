class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :battle_members, as: :battle_member
  has_many :battles, through: :battle_members
  has_many :challenge_members, as: :challenge_member
  has_many :challenges, through: :challenge_members
end
