json.array!(@variants) do |variant|
  json.extract! variant, :id, :variant_id, :product_id, :title, :price
  json.url variant_url(variant, format: :json)
end
