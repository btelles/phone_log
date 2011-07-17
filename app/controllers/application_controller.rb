class ApplicationController < ActionController::Base
  protect_from_forgery
  def title
    %w{Phone Logs}
  end
  helper_method :title
  hide_action :title
end
