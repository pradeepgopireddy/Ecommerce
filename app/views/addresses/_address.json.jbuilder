json.extract! address, :id, :name, :details, :street, :landmark, :state, :city, :pincode, :created_at, :updated_at
json.url address_url(address, format: :json)
