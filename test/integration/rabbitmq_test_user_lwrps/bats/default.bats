@test "rabbitmqctl status runs successfully" {
  run sudo /usr/sbin/rabbitmqctl status
  [ $status -eq 0 ]
  # would do grep pid in $output
}

@test "rabbitmqctl list_users should have kitchen3 user" {
    run grep 'kitchen3' <(sudo rabbitmqctl list_users)
    if [ ! $status -eq 0 ]; then
        sudo rabbitmqctl list_users
        exit 1
    fi
    [ ! "$output" = "" ]
}

@test "rabbitmqctl list_users should not have guest user" {
    run grep 'guest' <(sudo rabbitmqctl list_users)
    [ $status -eq 1 ]
}
