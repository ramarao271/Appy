json.array!(@products) do |product|
  json.extract! product, :id, :product_id, :title, :vendor
  json.extract! product.descriptions
  json.url product_url(product, format: :json)
end
