class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges

  after_save :notify_users

  def notify_users
    users = User.where(id: self.battle_members.pluck(:battle_member_id))
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end
