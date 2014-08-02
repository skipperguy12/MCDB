module McDb
  class Cluster
    include Mongoid::Document
    store_in collection: "dndb_clusters", database: "dndb_clusters"
    field :name, type: String
    field :visibility, type: String
  end
end
