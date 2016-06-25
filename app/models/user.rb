class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :challenge_members, as: :member
  has_many :challenges, through: :challenge_members

  def all_challenges
    challenges = []
    self.battles.each do |battle|
      challenges << battle.challenges
    end
    challenges
  end
end
