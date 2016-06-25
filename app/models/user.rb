class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :battle_members, as: :member
  has_many :battles, through: :battle_members
  has_many :challenge_members, as: :member
  has_many :challenges, through: :challenge_members

  def all_challenges
    challenge_ids = []
    self.battles.each do |battle|
      battle.challenges.each do |challenge|
        challenge_ids << challenge.id
      end
    end
  Challenge.where(id: challenge_ids)
  end
end
