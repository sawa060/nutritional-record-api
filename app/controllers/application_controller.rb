class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  skip_before_action :verify_authenticity_token, raise: false
  helper_method :current_user, :user_signed_in?

  private

  def pager(records)
    [records.count, records.pager(params)]
  end

  def simple_search_param
    params[:simple_search]
  end
end
