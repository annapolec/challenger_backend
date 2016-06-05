class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :challenge_members, as: :member
  has_many :challenges, through: :challenge_members

  def all_battles
    self.battles + Battle.where(owner_id: self.id)
  end

  def all_challenges
    self.challenges + Challenge.where(owner_id: self.id)
  end
end
