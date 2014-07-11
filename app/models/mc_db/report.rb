module McDb
  class Report
    include Mongoid::Document
    field :report, type: String
    field :reporter, type: String
    field :reported, type: String
    field :server, type: String
    field :cluster, type: String
    field :created, type: Time
  end
end
