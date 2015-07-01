json.array!(@profiles) do |profile|
  json.extract! profile, :id, :profile_id, :profile_type, :nickname, :birthday, :phone, :mobile, :fax, :address, :city, :province, :country, :zipcode, :website
  json.url profile_url(profile, format: :json)
end
