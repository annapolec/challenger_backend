class Battle < ActiveRecord::Base
  has_many :battle_members
  has_many :challenges
  validates :name, presence: true
  after_save :notify_users

  def for_users?
    !mode
  end

  def for_groups?
    mode
  end

  def notify_users
    users = User.where(id: self.battle_members.pluck(:member_id))
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end
