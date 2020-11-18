class ServerSerializer < ActiveModel::Serializer
  attributes :id, :ip, :country, :region, :username, :password, :premium, :flag

  def region
    object.country.region
  end

  def country
    object.country.name
  end

  def flag
    "www.countryflags.io/#{object.country.code}/shiny/64.png"
  end
end
