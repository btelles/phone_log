class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string     :title
      t.references :assigned_to
      t.string     :bound
      t.references :company
      t.references :opened_at
      t.string     :store_number
      t.references :reason_code
      t.references :additional_reason_code
      t.references :product
      t.boolean    :escalated
      t.references :escalated_to
      t.references :duration
      t.string     :order_rma
      t.datetime   :opened_at
      t.string     :attachment
      t.text       :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :logs
  end
end
