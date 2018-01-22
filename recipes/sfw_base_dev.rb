# installs applications for development use -- don't use in production

node['ds-rails'][:packages][:base].each do |pkg,ver|
  package pkg do
    if ver == "latest"
      action :upgrade
    else
      action ver
    end
  end
end
