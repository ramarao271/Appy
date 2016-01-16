json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :id, :variant_id, :variant_title, :product_id, :title, :quantity, :price, :order_id
  json.url line_item_url(line_item, format: :json)
end
