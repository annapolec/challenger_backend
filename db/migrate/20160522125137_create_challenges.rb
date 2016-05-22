class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :desc
      t.integer :points
      t.belongs_to :battle, index: true
      t.boolean :status
      t.integer :owner_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :challenges, :users, column: :owner_id
  end
end
