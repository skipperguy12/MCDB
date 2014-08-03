module McDb
  class Session
    include Mongoid::Document
    store_in collection: "dndb_sessions", database: "dndb_sessions"
    field :server, type: BSON::ObjectId
    field :start, type: DateTime
    field :end, type: DateTime
    field :length, type: Integer
    field :user, type: BSON::ObjectId
    field :ended_correctly, type: Mongoid::Boolean
    field :ended_with_punish, type: Mongoid::Boolean
    field :ip, type: String
  end
end
