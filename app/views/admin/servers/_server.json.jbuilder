json.extract! server, :id, :country, :flag, :ip, :username, :password, :premuim, :created_at, :updated_at
json.url server_url(server, format: :json)
