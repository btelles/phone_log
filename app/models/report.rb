class Report < ActiveRecord::Base

  def results
    self.class.find_by_sql(sql)
  end
end
