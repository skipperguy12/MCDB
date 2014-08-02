module McDb
  class Group
    include Mongoid::Document
    store_in collection: "dndb_groups", database: "dndb_groups"
    field :name, type: String
    field :flair, type: String
    field :flair_color, type: String
    field :priority, type: Integer
    field :members, type: Array, :default => []
    field :mc_permissions
    field :cluster, type: BSON::ObjectId
    field :web_permissions, type: Array

    before_save :fix_perms
    before_save :fix_cluster

    def fix_cluster
      self.cluster = Cluster.where(:name => self.cluster).first.id if self.cluster.kind_of?(String)
    end

        def fix_perms
            if self.mc_permissions.kind_of?(String)
                self.mc_permissions = self.mc_permissions.gsub("\r", "").split("\n")
            end
        end
  end
end
