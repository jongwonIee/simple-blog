class OptimismChannel < ApplicationCable::Channel
  def subscribed
    stream_from "OptimismChannel"
    stream_for current_author
  end
end
