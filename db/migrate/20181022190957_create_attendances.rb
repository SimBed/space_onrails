class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.date :date
      t.references :package, foreign_key: true

      t.timestamps
    end
    add_index :attendances, [:package_id, :created_at]
  end
end
