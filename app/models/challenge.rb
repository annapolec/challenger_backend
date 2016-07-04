class Challenge < ActiveRecord::Base
  belongs_to :battle
  has_many :challenge_members
  validates :name, presence: true
  validates :points, numericality: { greater_than: 0 }
  after_save :notify_users

  def notify_users
    users = User.where(id: self.battle.battle_members.pluck(:member_id))
    users.each do |user|
      FirebaseService.new.notify(user)
    end
  end
end
