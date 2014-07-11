require "mc_db/engine"

module McDb
  mattr_accessor :base_path, :user_class

  class << self
    def base_path
      @@base_path ||= Rails.application.routes.named_routes[:McDb].path
    end
  end

  def user_class
    if @@user_class.is_a?(Class)
      raise "You can no longer set McDb.user_class to be a class. Please use a string instead."
    elsif @@user_class.is_a?(String)
      begin
        Object.const_get(@@user_class)
      rescue NameError
        @@user_class.constantize
      end
    end
  end
end
