# installs applications for development use -- don't use in production

node['ds-rails']['packages']['base'].each do |p,v|
  package p do
    if v == "latest"
      action :upgrade
    else
      version v
    end
  end
end
