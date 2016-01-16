json.array!(@line_item_properties) do |line_item_property|
  json.extract! line_item_property, :id, :name, :value, :line_item_id
  json.url line_item_property_url(line_item_property, format: :json)
end
