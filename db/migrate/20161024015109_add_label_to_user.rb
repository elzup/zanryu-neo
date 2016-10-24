class AddLabelToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :label, :string
  end
end
