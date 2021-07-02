class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier
  before_action :authenticate_author!

  private

  def set_action_cable_identifier
    cookies.encrypted[:author_id] = current_author&.id
  end
end