module McDb
  class Server
    include Mongoid::Document
    store_in collection: "dndb_servers", database: "dndb_servers"
    field :name, type: String
    field :address, type: String
    field :visibility, type: String
    field :internal_name, type: String
    field :internal_address, type: String
    field :port, type: Integer
    field :internal_port, type: Integer
    field :max_players, type: Integer
    field :start, type: DateTime
    field :online_players, type: Array
    field :online_staff, type: Array
    field :online, type: Mongoid::Boolean
    field :cluster, type: BSON::ObjectId

    before_save :fix_cluster

    def fix_cluster
      self.cluster = Cluster.where(:name => self.cluster).first.id
    end
  end
end
