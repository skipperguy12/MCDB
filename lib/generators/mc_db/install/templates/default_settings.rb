
# NOTE: These are the settings that McDb will add to the database by default, you shoud add more settings from the admin panel.
avalible_models = %w(groups)

avalible_models.each do |model|
  
end
[
  {:name => "Test", :values => %w(on off), :default => "on", :description => 'Hi.', :cluster => "all"}
].each do |setting|
  s = Setting.new
  puts "#{setting[:name]}"
end
