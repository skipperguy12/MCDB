class User
    include Mongoid::Document
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

    field :email,              :type => String
    field :encrypted_password, :type => String
    field :username,           :type => String

    field :reset_password_token,   :type => String
    field :reset_password_sent_at, :type => Time

    field :remember_created_at, :type => Time

    field :sign_in_count,      :type => Integer
    field :current_sign_in_at, :type => Time
    field :last_sign_in_at,    :type => Time
    field :current_sign_in_ip, :type => String
    field :last_sign_in_ip,    :type => String
    field :mcSignIns,      :type => Integer, :default => 0
    field :mcLastSignInTime,    :type => DateTime
    field :mcLastSignInIp,    :type => String

    field :confirmation_token,   :type => String
    field :confirmed_at,         :type => Time
    field :confirmation_sent_at, :type => Time
    field :unconfirmed_email,    :type => String

    field :admin, :type => Boolean, :default => false

    def password_match?
        self.errors[:password] << 'passwords do not match' if password != password_confirmation
        self.errors[:password] << 'you must provide a password' if password.blank?
        password == password_confirmation and !password.blank?
    end

    def to_s
        self.username
    end

    def get_permission(*permission)
        permission.flatten!
        perms = self.web_permissions_full

        permission.each do |node|
            perms = perms[node]
            if perms.nil?
                if %w(forum group).include?(permission[0])
                    permission[1] = 'parent'
                    return self.get_permission_raw(permission)
                else
                    return nil
                end
            end
        end

        perms
    end

    def get_permission_raw(*permission)
        permission.flatten!

        perms = self.web_permissions_full

        permission.each do |node|
            begin
                perms = perms[node]
            rescue
                return nil
            end
        end

        perms
    end

    def has_permission?(*args)
        args.flatten!
        self.get_permission(args[0, args.length - 1]) == args[args.length - 1]
    end

    def groups_full
        match = {:members => self.username}
        Group.by_priority.any_of(match)
    end

    def web_permissions_full
        permissions = {}
        self.groups_full.sort_by {|group| group.priority}.reverse.each do |group|
            permissions.deep_merge!(group.web_permissions)
        end
        permissions
    end

    class << self
        def editable_fields
            return ['usrname', 'email', 'admin toggle', 'sign in count', 'last login date', 'password']
        end

        def viewable_fields
            return ['usrname', 'email', 'admin toggle', 'sign in count', 'last login date']
        end
    end
end
