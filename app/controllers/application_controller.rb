class ApplicationController < ActionController::Base
  before_action :authenticate_account!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def current_user
    current_account
  end
end
