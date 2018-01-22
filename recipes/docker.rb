docker_service 'default' do
  action [:create, :start]
end


docker_image 'postgres' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[postgres]'
end

template '/root/postgres.password' do
  source 'postgres.password.erb'
  owner 'root'
  group 'root'
end

docker_container 'postgres' do
  tag 'latest'
  port '5432:5432'
  env "POSTGRES_PASSWORD=#{node['postgresql']['password']['postgres']}"
end
