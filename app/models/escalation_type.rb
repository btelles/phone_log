class EscalationType < ActiveRecord::Base
  has_many :logs, :foreign_key => :escalated_to_id
end
