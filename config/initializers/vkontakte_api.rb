VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization):
 config.app_id       = '4555065'
 config.app_secret   = '9xaavputwSPmdEbaCBE4'
 config.redirect_uri = 'http://aqueous-ridge-4015.herokuapp.com/'
  
  # Faraday adapter to make requests with:
  # config.adapter = :net_http
  
  # HTTP verb for API methods (:get or :post)
  # config.http_verb = :get
  
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  
  # log requests' URLs
  # config.log_requests = true
  
  # log response JSON after errors
  # config.log_errors = true
  
  # log response JSON after successful responses
  # config.log_responses = false
end

# create a short alias VK for VkontakteApi module
# VkontakteApi.register_alias
