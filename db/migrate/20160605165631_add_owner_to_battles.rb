class AddOwnerToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :owner_id, :integer
    add_foreign_key :battles, :users, column: :owner_id
  end
end
