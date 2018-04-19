default['ds-rails'][:packages][:base] = case node['platform_family']
                                               when 'ubuntu','debian'
                                                 {
                                                     "gcc" => "latest",
                                                     "g++" => "latest",
                                                     "emacs-window-layout" => "latest",
                                                     "vim" => "latest",
                                                     "openssh-server" => "latest",
                                                     "sqlite3" => "latest",
                                                     "libsqlite3-dev" => "latest",
                                                     "postgresql-client" => "latest",
                                                     "libpq-dev" => "latest"
                                                 }
                                               else
                                                 {}
                                             end


default['ds-rails'][:packages][:rails] = case node['platform_family']
                                                when 'ubuntu','debian'
                                                  {
                                                      "ruby" => "latest",
                                                      "ruby-dev" => "latest",
                                                      "libxml2" => "latest",
                                                      "libxml2-dev" => "latest",
                                                      "libxml2-utils" => "latest",
                                                      "nodejs" => "latest"
                                                  }
                                                else
                                                  {
                                                  }
                                              end


default['ds-rails'][:packages][:ruby_gems] = {
    "bundler" => "latest",
    "passenger" => "latest",
    "rails" => "latest",
    "rspec" => "latest",
    "rspec-core" => "latest",
    "rspec-expectations" => "latest",
    "rspec-mocks" => "latest",
    "rspec-rails" => "latest",
    "rspec-support" => "latest"
}