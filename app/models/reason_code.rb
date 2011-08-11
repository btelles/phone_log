class ReasonCode < ActiveRecord::Base
  has_many :logs
  has_many :additional_logs, :foreign_key => :additional_reason_code_id
end
