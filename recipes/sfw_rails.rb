execute "nodejs" do
  command "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -" if node['ds-rails']['nodejs']['version'] == "8"
  command "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -" if node['ds-rails']['nodejs']['version'] == "9"
end



node['ds-rails']['packages']['rails'].each do |p,v|
  package p do
    if v == "latest"
      action :upgrade
    else
      version v
    end
  end
end




case node['platform']
  when 'debian', 'ubuntu'
    case node['platform_version']
      when '14.04'
        package "ruby1.9.1" do
          action :purge
          options "--force-yes"
          notifies :run, "execute[fix-irb-23]", :immediately
          notifies :run, "execute[fix-gem-23]", :immediately
          notifies :run, "execute[fix-rake-23]", :immediately
          notifies :run, "execute[fix-ruby-23]", :immediately
        end

        execute "fix-irb-23" do
          command "rm -f /usr/bin/irb ; ln -s /usr/bin/irb2.3 /usr/bin/irb ; ln -s /usr/bin/irb2.3 /usr/local/bin/irb"
          action :nothing
        end

        execute "fix-gem-23" do
          command "rm -f /usr/bin/gem ; ln -s /usr/bin/gem2.3 /usr/bin/gem ; ln -s /usr/bin/gem2.3 /usr/local/bin/gem"
          action :nothing
        end

        execute "fix-rake-23" do
          command "rm -f /usr/local/bin/rake ; rm -f /usr/bin/rake; ln -s /usr/bin/rake2.3 /usr/bin/rake ; ln -s /usr/bin/rake2.3 /usr/local/bin/rake"
          action :nothing
        end

        execute "fix-ruby-23" do
          command "rm -f /usr/bin/ruby; ln -s /usr/bin/ruby2.3 /usr/bin/ruby ; ln -s /usr/bin/ruby2.3 /usr/local/bin/ruby"
          action :nothing
        end
    end
  when 'rhel', 'centos'
    log 'not supported' do
      message 'CentOS/RHEL is not supported at this time.  Sorry!'
      level :error
    end
end

execute "gem update --system"


node['ds-rails']['packages']['ruby_gems'].each do |p,v|
  gem_package p do
    if v == "latest"
      action :upgrade
    else
      version v
    end
  end
end
