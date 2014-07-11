module McDb
  class Engine < ::Rails::Engine
    isolate_namespace McDb

    config.generators do |g|
      g.template_engine :haml
      g.orm :mongoid
    end
  end
end
