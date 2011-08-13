class CreateLogsLogs < ActiveRecord::Migration
  def up
    create_table :logs_logs, :id => false do |t|
      t.integer :log_1_id
      t.integer :log_2_id
    end
  end

  def down
    drop_table :logs_logs
  end
end
