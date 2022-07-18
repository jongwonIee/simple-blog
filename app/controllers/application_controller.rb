class ApplicationController < ActionController::Base
  before_action :set_action_cable_identifier
  before_action :set_global_search_variable

  def set_global_search_variable
    @q = Post.order(id: :desc).ransack(params[:q])
    @posts = @q.result
  end

  private

  def set_action_cable_identifier
    cookies.encrypted[:author_id] = current_author&.id
  end
end