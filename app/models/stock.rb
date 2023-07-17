class Stock < ApplicationRecord
  def self.look_up(ticker_sym)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:api_key_p],
      secret_token: Rails.application.credentials.iex_client[:api_key_s],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    client.price(ticker_sym)
  end
end
