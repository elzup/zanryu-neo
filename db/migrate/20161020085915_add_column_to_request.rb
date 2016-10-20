class AddColumnToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :deleted, :boolean, default: false
    add_column :requests, :exported, :boolean, default: false
  end
end
