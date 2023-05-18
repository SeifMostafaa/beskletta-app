class TelegramEventsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    TelegramEvent.new(params: request_body).process
    head :ok
  end

  private

  def request_body
    JSON.parse(request.raw_post)
  end
end