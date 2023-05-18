require "telegram/bot"

class TelegramEvent
  def initialize(params:)
    @params = params
  end

  def process
    bicycle = Bicycle.where(name: @params["message"]["text"].to_s).first

    if bicycle.present?
      telegram_api.send_message(
        chat_id: @params["message"]["chat"]["id"],
        text: "#{@params["message"]["text"]}'s Price is #{bicycle.price}",
      )
    else
      telegram_api.send_message(
        chat_id: @params["message"]["chat"]["id"],
        text: "Sorry, this bike is currently out of stock. Please check back later!",
      )
    end
  end

  private

  def telegram_api
    Telegram::Bot::Client.new(AppConfig.telegram["TELEGRAM_BOT_TOKEN"])
  end
end