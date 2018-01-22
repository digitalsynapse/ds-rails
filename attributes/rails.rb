# rails app specifics
default['ds-rails']['rails']['app_home_dir'] = "/var/www/rails"

default['ds-rails']['rails']['default_adapter'] = "postgresql"
default['ds-rails']['rails']['development_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
default['ds-rails']['rails']['test_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
default['ds-rails']['rails']['production_adapter'] = "#{node['ds-rails']['rails']['default_adapter']}"
