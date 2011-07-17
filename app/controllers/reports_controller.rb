class ReportsController < ApplicationController

  respond_to :html

  expose(:report)
  expose(:reports) { Report.scoped }

  def title
    %w{Reports}
  end


  def create
    if report.save
      redirect_to reports_path
    else
      respond_with report
    end
  end

  alias :update :create
end
