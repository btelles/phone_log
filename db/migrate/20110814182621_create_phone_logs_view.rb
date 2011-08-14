class CreatePhoneLogsView < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute(<<-SQL
CREATE OR REPLACE VIEW `phone_log_development`.`phone_logs` AS
(
SELECT
  l.opened_at as opened_date,
  l.title,
  CONCAT(e.first_name, ' ', e.last_name) AS assigned_to,
  l.bound AS in_out_bound,
  c.name AS company,
  store_number,
  rc.name AS reason_code,
  arc.name AS additional_reason_code,
  p.name AS product_code,
  CASE escalated WHEN 1 THEN 'Yes' ELSE 'No' END AS escalated,
  CONCAT(esc.first_name, ' ', esc.last_name) AS escalated_to,
  d.name AS duration,
  l.order_rma,
  l.notes,
  l.attachment AS attachment_name,
  CONCAT('http://phonelogs.local/uploads/log/attachment/',l.id,'/',l.attachment) AS attachment_link

FROM `logs` l
LEFT OUTER JOIN employees e ON e.id = l.assigned_to_id
LEFT OUTER JOIN companies c ON e.id = l.company_id
LEFT OUTER JOIN reason_codes rc ON rc.id = l.reason_code_id
LEFT OUTER JOIN reason_codes arc ON arc.id = l.additional_reason_code_id
LEFT OUTER JOIN products p ON p.id = l.product_id
LEFT OUTER JOIN employees esc ON esc.id = l.escalated_to_id
LEFT OUTER JOIN durations d ON d.id = l.duration_id
);

    SQL
                                         )
  end

  def down
  end
end
