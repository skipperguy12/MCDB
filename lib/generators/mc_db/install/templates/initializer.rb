McDb.user_class = "<%= user_class %>"

McDb.website_permissions = {
    :punishment => [
        {:node => %w(manage), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}], :default => 0}, :display => 'manage punishments (overrides all other punishment permissions)'},
        {:node => %w(create warn), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}], :default => 0}, :display => 'issue warns'},
        {:node => %w(create kick), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}], :default => 0}, :display => 'issue kicks'},
        {:node => %w(create ban), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}], :default => 0}, :display => 'issue bans'},
        {:node => %w(delete), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => 'all', :display => 'All'}, {:node => 'own', :display => 'Own (issued)'}], :default => 0}, :display => 'delete punishments'},
    ],
    :admin_panel => [
        {:node => %w(view base), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'access the root panel (Need to be true for all other perms to work)'},
        {:node => %w(view groups), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the groups admin panel'},
        {:node => %w(view users), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the users admin panel'},
        {:node => %w(view servers), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the servers admin panel'},
        {:node => %w(view reports), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the reports admin panel'},
        {:node => %w(view logs), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the logs admin panel'},
        {:node => %w(view files), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'view the files admin panel'},
    ],
    :group => [
        {:node => %w(manage), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'manage the group (overrides all other permissions for this group)'},
        {:node => %w(delete), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'delete the group'},
    ],
    :user => [
        {:node => %w(manage), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'manage the user (overrides all other user permissions)'},
        {:node => %w(create), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'create a user'},
        {:node => %w(delete), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'delete the user'},
    ],
    :server => [
        {:node => %w(manage), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'manage the server (overrides all other server permissions)'},
        {:node => %w(create), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'create a server'},
        {:node => %w(delete), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'delete the server'},
    ],
    :report => [
        {:node => %w(manage), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'manage the report (overrides all other report permissions)'},
        {:node => %w(create), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'create a report'},
        {:node => %w(delete), :options => {:array => [{:node => 'abstain', :display => 'Abstain'}, {:node => true, :display => 'Yes'}, {:node => false, :display => 'No'}], :default => 0}, :display => 'delete the report'},
    ]
}
