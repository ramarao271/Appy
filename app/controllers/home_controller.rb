class HomeController < AuthenticatedController
  before_filter :init_webhooks
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end
  def init_webhooks
    topics = ["customers/create", "orders/create"]
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    topics.each do |topic|
      webhook = ShopifyAPI::Webhook.new(:format => "json", :topic => topic, :address => "https://shopify-ramarao271.c9.io/webhooks/#{topic}")
      raise "Webhook invalid: #{webhook.errors}" unless webhook.valid?
    end
  end
end
