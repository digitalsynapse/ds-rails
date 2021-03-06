


default['ds-rails']['database']['type'] = "postgresql"



default['ds-rails']['development']['database']['database_host'] = "127.0.0.1"
default['ds-rails']['development']['database']['database_name'] = "#{node['ds-rails']['rails']['application_name']}_development_db"
default['ds-rails']['development']['database']['database_user'] = "#{node['ds-rails']['rails']['application_name']}_development_user"
default['ds-rails']['development']['database']['password'] = "digitalsynapse"


default['ds-rails']['test']['database']['database_host'] = "127.0.0.1"
default['ds-rails']['test']['database']['database_name'] = "#{node['ds-rails']['rails']['application_name']}_test_db"
default['ds-rails']['test']['database']['database_user'] = "#{node['ds-rails']['rails']['application_name']}_test_user"
default['ds-rails']['test']['database']['password'] = "digitalsynapse"


default['ds-rails']['production']['database']['database_host'] = "127.0.0.1"
default['ds-rails']['production']['database']['database_name'] = "#{node['ds-rails']['rails']['application_name']}_db"
default['ds-rails']['production']['database']['database_user'] = "#{node['ds-rails']['rails']['application_name']}_user"
default['ds-rails']['production']['database']['password'] = "digitalsynapse"



# Postgres specific

default['postgresql']['pg_gem']['version'] = '0.21.0'
default['postgresql']['password']['postgres'] = "digitalsynapse"
