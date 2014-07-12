module McDb
  class Punishment
    include Mongoid::Document
    include Mongoid::Timestamps
    field :reason, type: String
    field :created, type: DateTime
    field :expires, type: DateTime
    field :type, type: String
    field :punisher, type: String
    field :punished, type: String
    field :appealable, type: Mongoid::Boolean
    field :cluster, type: String
    field :active, type: Mongoid::Boolean
    field :server, type: String

    def reason_color
        if self.type == "warn"
            "green"
        elsif self.type == "kick"
            "orange"
        elsif self.type == "ban"
            "red"
        else
            "black"
        end
    end
  end
end
