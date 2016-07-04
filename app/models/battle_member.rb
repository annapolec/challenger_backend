class BattleMember < ActiveRecord::Base
  belongs_to :member, polymorphic: true
  belongs_to :battle

  after_create :notify_users

  def notify_users
    users = User.where(id: BattleMember.where(battle_id: self.battle_id).pluck(:member_id))
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end