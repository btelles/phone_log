class AddReferencesToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :product_id, :integer
    add_column :logs, :client_id, :integer
  end

  def self.down
    remove_column :logs, :client_id
    remove_column :logs, :product_id
  end
end
