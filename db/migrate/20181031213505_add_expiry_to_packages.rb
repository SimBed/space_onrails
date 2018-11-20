class AddExpiryToPackages < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :validity_type, :string
    add_column :packages, :validity_period, :integer
    add_column :packages, :expiry, :date
  end
end
