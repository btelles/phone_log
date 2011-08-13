class Log < ActiveRecord::Base

  belongs_to :assigned_to, :class_name => 'Employee'
  belongs_to :company
  belongs_to :reason_code
  belongs_to :additional_reason_code, :class_name => 'ReasonCode'
  belongs_to :product
  belongs_to :escalated_to, :class_name => 'EscalationType', :foreign_key => :escalated_to_id
  belongs_to :duration
  has_and_belongs_to_many :related_logs, join_table: 'logs_logs',
                                 foreign_key: :log_1_id,
                                 association_foreign_key: :log_2_id,
                                 finder_sql: proc { "SELECT logs.* FROM logs_logs
                                                     INNER JOIN `logs` ON logs_logs.log_2_id = logs.id 
                                                     WHERE log_1_id = #{self.id}
                                                     UNION ALL 
                                                     SELECT logs.* FROM logs_logs
                                                     INNER JOIN `logs` ON logs_logs.log_1_id = logs.id 
                                                     WHERE log_2_id = #{self.id}" },
                                 class_name: 'Log'

  mount_uploader :attachment, FileUploader

  paginates_per 50

  BOUND_OPTIONS= %w{Inbound Outbound}

  scope :search, lambda { |params|
    srch = select(['logs.id as id', :title, :name]).
           joins("left outer join companies on companies.id = logs.company_id")
    srch = srch.where(["title like ?", "%#{params[:title_like]}%"])   if params[:title_like].present?
    srch = srch.where(["name  like ?", "%#{params[:company_like]}%"]) if params[:company_like].present?
    srch = srch.where(["logs.id not in (?)", params[:related_logs]])       if params[:related_logs].present?
    srch
  }

end
