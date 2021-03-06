class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  skip_before_filter  :verify_authenticity_token
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
