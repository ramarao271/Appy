ShopifyApp.configure do |config|
  config.api_key = "ccec25f6b73bd6dfa81f4931a8b9b381"
  config.secret = "3ebf4330b824c33ed1a756d1c7f11e92"
  config.redirect_uri = "https://shopify-ramarao271.c9.io/auth/shopify/callback"
  config.scope = "read_orders, read_products,write_customers"
  config.embedded_app = true
end
