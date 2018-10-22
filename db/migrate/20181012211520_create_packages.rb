class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :instructor
      t.date :purchased_on
      t.integer :classes
      t.string :classes_taken
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :packages, [:user_id, :created_at]
  end
end
