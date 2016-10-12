class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.references :admin, foreign_key: true
      t.date :date

      t.timestamps
    end
    add_index :requests, :date
    add_index :requests, [:admin_id, :date]
    add_index :requests, [:user_id, :admin_id, :room_id, :date], unique: true
  end
end
