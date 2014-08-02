require 'rails/generators'
module McDb
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option "user-class", :type => :string
      class_option "current-user-helper", :type => :string
      class_option "use-web-perms", :type => :boolean

      source_root File.expand_path("../install/templates", __FILE__)
      desc "Used to install McDb"

      def determine_user_class
        @user_class = options["user-class"].presence ||
                      ask("What is your user class called? [User]").presence ||
                      'User'
      end

      def determine_current_user_helper
        current_user_helper = options["current-user-helper"].presence ||
                              ask("What is the current_user helper called in your app? [current_user]").presence ||
                              :current_user

        puts "Defining mcdb_user method inside ApplicationController..."

        mcdb_user_method = %Q{
  def mcdb_user
    #{current_user_helper}
  end
  helper_method :mcdb_user

}

        inject_into_file("#{Rails.root}/app/controllers/application_controller.rb",
                         mcdb_user_method,
                         :after => "ActionController::Base\n")

      end

      def add_initializer
        path = "#{Rails.root}/config/initializers/mc_db/initializer.rb"
        if File.exists?(path)
          puts "Skipping config/initializers/mcdb.rb creation, as file already exists!"
        else
          puts "Adding McDb initializer (config/initializers/mcd/initializer.rb)..."
          template "initializer.rb", path
        #  require path # Load the configuration per issue #415
        end
      end

      def setup_web_perms
        path = "#{Rails.root}/config/initializers/mc_db/webperms.rb"
        backup_path = "#{Rails.root}/config/initializers/mc_db/webperms.rb.backup"
        if File.exists?(path)
          puts "Skipping config/initializers/mcdb_webperms.rb creation, as file already exists!"
          puts "NOTE: If you are upgrading to a new gem version some permissions might have changed, we can make a backup of your old permissions and add the default ones just in case."
          result = ask("Proceed? [No]").presence ||
          false
          if result
              puts "Making a backup of your current permissions..."
              copy_file path, backup_path
              puts "Addming defaukt permissions..."
              template "webperms.rb", path
          end
        else
          puts "Adding default McDb web permissions (config/initializers/mcdb/webperms.rb)..."
          puts "Default website permissions are stored here, feel free to edit them to suit your needs."
          template "webperms.rb", path
        end
      end

      def mount_engine
        puts "Mounting McDb::Engine at \"/admin\" in config/routes.rb..."
        insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
          %Q{
  # This line mounts McDb's routes at /admin by default.
  # This means, any requests to the /admin URL of your application will go to McDb::ApplicationController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as McDb relies on it being the default of "mcdb"
  mount McDb::Engine, :at => '/admin'

}
        end
      end

      def finished
        output = "\n\n" + ("*" * 53)
        output += %Q{\nDone! McDb has been successfully installed. Yaaaaay!

Here's what happened:\n\n}

        output += step("A new method called `mcdb_user` was inserted into your ApplicationController.
   This lets McDb know what the current user of your application is.\n")
        output += step("A new file was created at config/initializers/mcdb.rb
   This is where you put McDb's configuration settings.\n")

        output += step("The engine was mounted in your config/routes.rb file using this line:

   mount McDb::Engine, :at => \"/admin\"

   If you want to change where the admin panels are located, just change the \"/admin\" path at the end of this line to whatever you want.")
        output += %Q{\nAnd finally:

#{step("We told you that McDb has been successfully installed and walked you through the steps.")}}
        unless defined?(Devise)
          output += %Q{We have detected you're not using Devise (which is OK with us, really!), so there's one extra step you'll need to do.

   You'll need to define a "sign_in_path" method for McDb to use that points to the sign in path for your application. You can set McDb.sign_in_path to a String inside config/initializers/mcdb.rb to do this, or you can define it in your config/routes.rb file with a line like this:

          get '/users/sign_in', :to => "users#sign_in"

   Either way, McDb needs one of these two things in order to work properly. Please define them!}
        end
        output += "Thanks for using McDb!"
        puts output
      end

      private

      def step(words)
        @step ||= 0
        @step += 1
        "#{@step}) #{words}\n"
      end

      def user_class
        @user_class
      end
    end
  end
end
