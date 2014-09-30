def my_twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'pSaNyKO5RFRHp1aeiaDvRyZgw'
    config.consumer_secret     = 'ZPLyQzbnItG8FHNrS8QHhto262lzp4Lz7qGVxis012HLvVlk6P'
    config.access_token        = '38949872-Euvw0r3SmlwjSjScQuqq6SXXx1MUPYWrMsoprCMnY'
    config.access_token_secret = 'Opn7xZVZNUDr1JkkYIOuY7CMdioJwASF5fvOWfXPt4byj'
  end
end
