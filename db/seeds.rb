
def set_old_created_at_for_cucumber(tables)
  tables.each {|table| table.to_s.classify.constantize.update_all("#{table}.created_at = date('1950-01-01 01:01:01')")}
end

require 'active_record/fixtures'
user = User.create(:email => 'g_admin') #, :role => role)
set_old_created_at_for_cucumber(['users'])

# All environments
all_seeds = Dir["db/seeds/*.csv"].map { |file| File.basename(file, '.csv').to_sym }
Fixtures.create_fixtures('db/seeds', all_seeds)
set_old_created_at_for_cucumber(all_seeds)

#The current environment
environment_specific_seeds = Dir["db/seeds/#{Rails.env}/*.csv"].map { |file| File.basename(file, '.csv').to_sym }
Fixtures.create_fixtures("db/seeds/#{Rails.env}", environment_specific_seeds)
set_old_created_at_for_cucumber(environment_specific_seeds)



User.create(email: 'btelles@gmail.com',
            password: 'aaaaaa',
            password_confirmation: 'aaaaaa')
