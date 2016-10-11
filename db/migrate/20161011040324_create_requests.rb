class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
