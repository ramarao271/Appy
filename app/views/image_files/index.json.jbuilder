json.array!(@image_files) do |image_file|
  json.extract! image_file, :id, :path,:product_type, :image_for, :cost, :pairs, :name
  json.url image_file_url(image_file, format: :json)
end
