class Server
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :visibility, type: String
  field :internal_name, type: String
  field :internal_address, type: String
  field :port, type: Integer
  field :internal_port, type: Integer
  field :max_players, type: Integer
  field :uptime, type: Integer
  field :online_players, type: Array
  field :online_staff, type: Array
  field :online, type: Mongoid::Boolean
end
