# rails_app.rb
#
# Things related to getting the app up and populated.  This is done after the lower level stuff has been done
# (i.e. system install, DB install/setup, ruby/rails install, patches, etc.)
#


template "#{node['ds-rails']['rails']['app_home_dir']}/config/database.yml" do
  source "database.yaml.erb"
end


# Install RAILS gems
execute "install-app-gems" do
  command "cd #{node['ds-rails']['rails']['app_home_dir']} ; bundle install"
  not_if { ::File.exists?("#{node['ds-rails']['rails']['app_home_dir']}/Gemfile.lock") }
end

