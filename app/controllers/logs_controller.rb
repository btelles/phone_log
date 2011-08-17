class LogsController < ApplicationController

  respond_to :html, :js

  expose(:log)
  expose(:logs) { Log.order('opened_at desc').page params[:page]}
  expose(:log_search) { Log.search(params[:log]) }

  def title
    %w{Phone Logs}
  end


  def create
    params[:log][:related_log_ids] = [] unless params[:log][:related_log_ids].present?
    if log.save
      session[:assigned_to_id]= params[:log][:assigned_to_id] if params[:log][:assigned_to_id].present?
      flash[:notice] = "Saved the log entry successfully."
      case params[:commit]
      when 'Save and List'
        redirect_to logs_path
      when 'Save and Continue Editing'
        redirect_to edit_log_path(log)
      when 'Save and Add Another'
        redirect_to new_log_path
      end
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
