class ProductsWebhookController < ApplicationController
    before_filter :verify_webhook, :except => ['verify_webhook']
    def create_product
        product = ActiveSupport::JSON.decode(request.body.read)
        create_product(product)
    end
end