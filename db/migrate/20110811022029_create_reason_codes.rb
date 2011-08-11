class CreateReasonCodes < ActiveRecord::Migration
  def change
    create_table :reason_codes do |t|
      t.string :name

      t.timestamps
    end
  end
end
