class ReportsController < ApplicationController
  expose(:report)
  expose(:reports) { Report.scoped }

  def title
    %w{Reports}
  end
end
