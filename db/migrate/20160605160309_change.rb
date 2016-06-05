class Change < ActiveRecord::Migration
  def change
    rename_column :battle_members, :battle_member_type, :member_type
    rename_column :battle_members, :battle_member_id, :member_id
    rename_column :challenge_members, :challenge_member_type, :member_type
    rename_column :challenge_members, :challenge_member_id, :member_id
    
  end
end
