# Thanks to plataformatec/devise
# The code used to inspire this generator!
require 'rails/generators'
module McDb
  module Generators
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/views/forem", __FILE__)
      desc "Used to copy mcdb's views to your application's views. (Note:if you are planning on installing the web permissions add-on, don't do this yet.)"

      def copy_views
        view_directory :clusters
        view_directory :groups
        view_directory :punishments
        view_directory :reports
        view_directory :servers
      end

      protected

      def view_directory(name)
        directory name.to_s, "app/views/mc_db/#{name}"
      end
    end
  end
end
