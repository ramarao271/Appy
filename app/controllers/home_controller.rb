class HomeController < AuthenticatedController
  around_filter :shopify_session
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    init_webhooks
    redirect_to '/reward_settings/new'
  end
  def init_webhooks
    topics = ["customers/create", "orders/create"]
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    topics.each do |topic|
      webhook = ShopifyAPI::Webhook.create(:format => "json", :topic => topic, :address => "https://shopify-ramarao271.c9.io/webhooks/#{topic}")
      puts "inspect"
      puts webhook.inspect
      puts "yaml"
      puts webhook.to_yaml
      puts "attributes"
      puts webhook.attributes.values
      puts "debug"
      #debug(webhook)
      raise "Webhook invalid: #{webhook.errors}" unless webhook.valid?
    end
  end
end
