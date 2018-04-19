tag('database')
tag('test')



case node['ds-rails']['database']['type']
  when "postgresql"
    tag('postgres')

    include_recipe "postgresql::client"
    include_recipe "postgresql::server"
    include_recipe "database::postgresql"


    Chef::Recipe.send(:include, OpenSSLCookbook::RandomPassword)

    test_password = random_password

    node.default_unless['ds-rails']['test']['database']['database_password'] = test_password
    node.default_unless['ds-rails']['test']['database']['database_name'] = node['ds-rails']['test']['database']['database_name']

    postgresql_database node['ds-rails']['test']['database']['database_name'] do
      connection(
          :host     => node['ds-rails']['test']['database']['database_host'],
          :port     => 5432,
          :username => 'postgres',
          :password => node['postgresql']['password']['postgres']
      )
      template 'DEFAULT'
      encoding 'DEFAULT'
      tablespace 'DEFAULT'
      connection_limit '-1'
      owner "postgres"
      action :create
    end

    postgresql_connection_info = {
        :host     => node['ds-rails']['test']['database']['database_host'],
        :port     => 5432,
        :username => 'postgres',
        :password => node['postgresql']['password']['postgres']
    }

    database_user node['ds-rails']['test']['database']['database_user'] do
      connection postgresql_connection_info
      password node['ds-rails']['test']['database']['database_password']
      provider Chef::Provider::Database::PostgresqlUser
      action :create
    end

    postgresql_database_user node['ds-rails']['test']['database']['database_user'] do
      connection postgresql_connection_info
      database_name node['ds-rails']['test']['database']['database_name']
      privileges [:all]
      tables [:all]
      sequences [:all]
      functions [:all]
      schema_name 'public'
      action [:grant, :grant_schema, :grant_table, :grant_sequence, :grant_function]
    end

end