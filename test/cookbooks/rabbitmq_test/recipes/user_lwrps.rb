include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::user_management'

# force the rabbitmq restart now, then start testing
#execute 'sleep 10' do
  #notifies :restart, "service[#{node['rabbitmq']['service_name']}]", :immediately
#end

# can't verify it actually goes through without logging in, but at least exercise the code
rabbitmq_user 'kitchen3' do
  password 'foobar'
  action :change_password
end

rabbitmq_user 'guest' do
  action :delete
end
