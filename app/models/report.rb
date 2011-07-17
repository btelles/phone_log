class Report < ActiveRecord::Base

  paginates_per 50

  def results
    self.class.find_by_sql(sql)
  end
end
