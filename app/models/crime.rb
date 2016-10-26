class Crime < ApplicationRecord
  # geocoded_by :address   # can also be an IP address
  geocoded_by :address do |obj, results|
    if geo = results.first
      obj.neighborhood = geo.neighborhood
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode          # auto-fetch coordinates
end
