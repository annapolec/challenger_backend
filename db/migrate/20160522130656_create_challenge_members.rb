class CreateChallengeMembers < ActiveRecord::Migration
  def change
    create_table :challenge_members do |t|
        t.belongs_to :challenge, index: true
        t.integer :challenge_member_id
        t.string  :challenge_member_type
        t.boolean :completed
        t.timestamps null: false
    end

    add_index :challenge_members, :challenge_member_id
  end
end
