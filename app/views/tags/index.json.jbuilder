json.array!(@tags) do |tag|
  json.extract! tag, :id, :tag, :percentile
  json.url tag_url(tag, format: :json)
end
