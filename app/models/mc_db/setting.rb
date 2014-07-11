module McDb
  class Setting
    include Mongoid::Document
    field :name, type: String
    field :values, type: Array
    field :defValue, type: String
    field :isPlayerSetting, type: Mongoid::Boolean
    field :description, type: String
    field :cluster, type: String
  end
end
