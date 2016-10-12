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
    add_index :requests, :user
    add_index :requests, :admin
    add_index :requests, [:user, :room, :date], unique: true
  end
end
