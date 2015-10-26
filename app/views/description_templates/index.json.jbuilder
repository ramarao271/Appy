json.array!(@description_templates) do |description_template|
  json.extract! description_template, :id, :title, :description
  json.url description_template_url(description_template, format: :json)
end
