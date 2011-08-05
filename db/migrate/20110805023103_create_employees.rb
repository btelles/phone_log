class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :job_title
      t.string :business_phone
      t.string :home_phone
      t.string :mobile_phone
      t.string :fax_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :web_page
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
