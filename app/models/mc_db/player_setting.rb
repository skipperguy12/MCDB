module McDb
  class PlayerSetting
    include Mongoid::Document
    extend McDb::Setting
    
    has_one McDb.user_class
  end
end
