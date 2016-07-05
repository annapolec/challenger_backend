class AddModeToBattle < ActiveRecord::Migration
  def change
    add_column :battles, :mode, :boolean
  end
end
