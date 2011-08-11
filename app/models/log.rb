class Log < ActiveRecord::Base

  belongs_to :assigned_to, :class_name => 'Employee'
  belongs_to :company
  belongs_to :reason_code
  belongs_to :additional_reason_code, :class_name => 'ReasonCode'
  belongs_to :product

  paginates_per 50

  BOUND_OPTIONS= %w{Inbound Outbound}

end
