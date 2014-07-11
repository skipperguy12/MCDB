module McDb
  class Cluster
    include Mongoid::Document
    field :name, type: String
  end
end
