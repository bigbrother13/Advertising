class AddStatusToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :status, :integer, default: 0
  end
end
