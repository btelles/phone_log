class Log < ActiveRecord::Base

  belongs_to :assigned_to, :class_name => 'Employee'
  belongs_to :company
  belongs_to :reason_code
  belongs_to :additional_reason_code, :class_name => 'ReasonCode'
  belongs_to :product
  belongs_to :escalated_to, :class_name => 'EscalationType', :foreign_key => :escalated_to_id

  paginates_per 50

  BOUND_OPTIONS= %w{Inbound Outbound}

end
