module McDb
  class Punishment
    include Mongoid::Document
    store_in collection: "dndb_punishments", database: "dndb_punishments"
    field :punisher, type: UUID
    field :punished, type: UUID
    field :reason, type: String
    field :server, type: BSON::ObjectId
    field :type, type: String
    field :cluster, type: BSON::ObjectId
    field :active, type: Mongoid::Boolean
    field :appealable, type: Mongoid::Boolean
    field :automatic, type: Mongoid::Boolean
    field :when, type: DateTime
    field :expires, type: DateTime
  end
end
