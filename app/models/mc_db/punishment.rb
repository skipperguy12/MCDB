module McDb
  class Punishment
    include Mongoid::Document
    field :reason, type: String
    field :created, type: Time
    field :expires, type: Time
    field :type, type: String
    field :punisher, type: String
    field :punished, type: String
    field :appealable, type: Mongoid::Boolean
    field :cluster, type: String
    field :active, type: Mongoid::Boolean
  end
end
