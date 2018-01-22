include_recipe "ds-rails"


# install software we need
include_recipe "ds-rails::sfw_rails"

# setup databases
include_recipe "ds-rails::database_development_db"
include_recipe "ds-rails::database_test_db"
include_recipe "ds-rails::database_production_db"

#include_recipe "ds-rails::docker"
include_recipe "ds-rails::rails_app"
