class ApplicationController < ActionController::Base
  before_action :doorkeeper_authorize!, only: :me
  before_action :authenticate_user!, only: :user
  def me
    render json: User.find(doorkeeper_token.resource_owner_id).as_json
  end

  def user
    render html: current_user.as_json
  end
end
