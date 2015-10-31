json.array!(@customer_refer_emails) do |customer_refer_email|
  json.extract! customer_refer_email, :id, :customer_id, :refer_email, :no_of_times_sent, :joined
  json.url customer_refer_email_url(customer_refer_email, format: :json)
end
