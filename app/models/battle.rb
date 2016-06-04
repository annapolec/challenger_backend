class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges

  after_save :notify_users

  def notify_users
    users = self.battle_members.where(battle_member_type: "User")
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end
