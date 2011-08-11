class CreateEscalationTypes < ActiveRecord::Migration
  def change
    create_table :escalation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
