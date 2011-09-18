class ChangeTitleToCaller < ActiveRecord::Migration
  def up
    rename_column :logs, :title, :caller
  end

  def down
    rename_column :logs, :caller, :title
  end
end
