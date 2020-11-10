class ServerSerializer < ActiveModel::Serializer
  attributes :id, :ip, :country, :username, :password, :flag, :premium

  def flag
    object.flag.url
  end
end
