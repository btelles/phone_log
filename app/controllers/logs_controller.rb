class LogsController < ApplicationController

  respond_to :html, :js

  expose(:log)
  expose(:logs) { Log.order('opened_on desc').page params[:page]}
  expose(:log_search) { Log.search(params[:log]) }

  def title
    %w{Phone Logs}
  end


  def create
    if log.save
      redirect_to logs_path
    else
      respond_with log
    end
  end

  alias :update :create

  def destroy
    if log.destroy
      flash[:notice] = "Destroyed the log successfully."
    else
      flash[:alert] = "Failed to destroy the log."
    end
      redirect_to logs_path
  end
end
