json.array!(@image_files) do |image_file|
  json.extract! image_file, :id, :path, :image_for, :cost, :pairs
  json.url image_file_url(image_file, format: :json)
end
