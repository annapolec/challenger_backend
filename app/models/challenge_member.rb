class ChallengeMember < ActiveRecord::Base
  belongs_to :member, polymorphic: true
  belongs_to :challenge

  after_create :notify_users

  def notify_users
    users = User.where(id: ChallengeMember.where(challenge_id: self.challenge_id).pluck(:member_id))
    users = User.where(id: Battle.find(self.challenge.battle.id).battle_members.pluck(:member_id))
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end