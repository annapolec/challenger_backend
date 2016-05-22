class BattleMember < ActiveRecord::Base
  belongs_to :battle_member, polymorphic: true
  belongs_to :battle
end