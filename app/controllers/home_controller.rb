class HomeController < AuthenticatedController
  around_filter :shopify_session
  def index
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    # discounts=ShopifyAPI::Discount.all
    # discounts.to_yaml
    init_webhooks
    #redirect_to '/products/'
  end
  def init_webhooks
    topics = ["customers/create", "orders/create"]
    topics.each do |topic|
      webhook = ShopifyAPI::Webhook.create(:format => "json", :topic => topic, :address => "https://damp-retreat-8820.herokuapp.com/webhooks/#{topic}")
      if webhook.valid?
        puts "webhook created"
      else
        puts "webhook creation failed"
        #raise "Webhook invalid: #{webhook.errors}" unless webhook.valid?
      end
      #raise "Webhook invalid: #{webhook.errors}" unless webhook.valid?
    end
  end
end
