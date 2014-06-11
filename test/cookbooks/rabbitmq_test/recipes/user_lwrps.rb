include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::user_management'

# force restart the rabbitmq server, then sleep until it's ready(tm)
service node['rabbitmq']['service_name'] do
    action :restart
end
execute 'sleep 30' do
  action :run
end

# can't verify it actually goes through without logging in, but at least exercise the code
rabbitmq_user 'kitchen3' do
  password 'foobar'
  action :change_password
end

rabbitmq_user 'guest' do
  action :delete
end
