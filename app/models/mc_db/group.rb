module McDb
  class Group
    include Mongoid::Document
    field :name, type: String
    field :cluster, type: String
    field :priority, type: String
    field :members, type: Array
    field :minecraft_permissions, type: Array
    field :website_permissions, type: Array
    field :active, type: Mongoid::Boolean
    field :staff, type: Mongoid::Boolean
    field :html_color, type: String
  end
end
