module McDb
  class Server
    include Mongoid::Document
    field :name, type: String
    field :ip, type: String
    field :port, type: Integer
    field :publicIp, type: String
    field :publicPort, type: Integer
    field :cluster, type: String
    field :maxPlayers, type: Integer
    field :onlinePlayers, type: Array
    field :online, type: Mongoid::Boolean
  end
end
