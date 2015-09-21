json.array!(@premium_accounts) do |premium_account|
  json.extract! premium_account, :id, :name, :amount, :validity, :description
  json.url premium_account_url(premium_account, format: :json)
end
