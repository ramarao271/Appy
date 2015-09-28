json.array!(@options) do |option|
  json.extract! option, :id, :option_id, :product_id, :name, :values
  json.url option_url(option, format: :json)
end
