# rails app specifics


# NodeJS
default['ds-rails']['nodejs']['version'] = "8"

default['ds-rails']['rails']['application_name'] = "rails"
default['ds-rails']['rails']['app_home_dir'] = "/var/www/#{node['ds-rails']['rails']['application_name']}"

default['ds-rails']['rails']['default_adapter'] = "postgresql"
default['ds-rails']['rails']['development_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
default['ds-rails']['rails']['test_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
default['ds-rails']['rails']['production_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
