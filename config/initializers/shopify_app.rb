ShopifyApp.configure do |config|
  config.api_key = "3a4f78a9c1dbf4007f6c0e8713c7754b"
  config.secret = "7a0537530f0c6aea264bea134644bd71"
  config.redirect_uri = "http://damp-retreat-8820.herokuapp.com/auth/shopify/callback"
  config.scope = "read_orders, read_products,write_customers"
  config.embedded_app = true
end
