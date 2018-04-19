name 'ds-rails'
maintainer 'Robert Parkhurst'
maintainer_email 'raparkhurst@digitalsynapse.io'
license 'Apache 2'
description 'Installs/Configures ds-rails'
long_description 'Installs/Configures ds-rails'
version '0.1.9'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/ds-rails/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/ds-rails'


depends 'docker', '~> 4.0'
depends 'database'
depends 'postgresql'
depends 'nginx'
