class Create < ActiveRecord::Migration
  def change
    create_table :battle_members do |t|
        t.belongs_to :battle, index: true
        t.integer :battle_member_id
        t.string  :battle_member_type
        t.timestamps null: false
      end
   
      add_index :battle_members, :battle_member_id
    end
end
