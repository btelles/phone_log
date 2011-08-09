class Log < ActiveRecord::Base

  belongs_to :assigned_to, :class_name => 'Employee'

  paginates_per 50

end
