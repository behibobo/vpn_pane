class ServerSerializer < ActiveModel::Serializer
  attributes :id, :ip, :username, :password, :flag, :premium

  def flag
    object.flag.url
  end
end
