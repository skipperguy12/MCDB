module McDb
  class Membership
    include Mongoid::Document
    belongs_to :group
    belongs_to :user
  end
end
