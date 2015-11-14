ShopifyApp.configure do |config|
  config.api_key = "e7addfa43611d064b289ace6c592636e"
  config.secret = "1727fabbede4785bc6e07a4013ef4df6"
  config.redirect_uri = "http://vavarna.herokuapp.com/auth/shopify/callback/"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  
end
