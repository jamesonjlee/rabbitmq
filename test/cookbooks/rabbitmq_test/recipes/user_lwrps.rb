include_recipe 'rabbitmq::default'
include_recipe 'rabbitmq::user_management'

rabbitmq_user 'kitchen3' do
  password 'foobar'
  action :add
end

rabbitmq_user 'kitchen3' do
    vhost "/"
    permissions ".* .* .*"
    action :set_permissions
end

rabbitmq_user 'kitchen3' do
    tag "administrator,test"
    action :set_tags
end

rabbitmq_user 'guest' do
  action :delete
end
