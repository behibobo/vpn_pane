class ServerSerializer < ActiveModel::Serializer
  attributes :id, :ip, :country, :region, :username, :password, :premium, :flag, :name, :ping

  def region
    object.country.region
  end

  def country
    object.country.name
  end

  def flag
    "http://countryflags.io/#{object.country.code}/shiny/64.png"
  end

  def name
    object.country.name
  end
end
