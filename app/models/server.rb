class Server < ApplicationRecord
    mount_uploader :flag, FlagUploader
end
