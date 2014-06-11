@test "rabbitmqctl status runs successfully" {
  run sudo /usr/sbin/rabbitmqctl status
  [ "$status" -eq 0 ]
  # would do grep pid in $output
}

@test "rabbitmqctl list_users should have kitchen3 user" {
    status="$(sudo rabbitmqctl list_users | grep kitchen3)"
    [ $? -eq 0 ]
    [ $status -eq "kitchen3" ]
}

@test "rabbitmqctl list_users should not have guest user" {
    status="$(sudo rabbitmqctl list_users | grep guest)"
    [ $? -eq 1 ]
    [ $status -eq "" ]
}
