app_path = File.expand_path('../..', __FILE__)
bind "unix://#{app_path}/tmp/sockets/puma.sock"

pidfile '/tmp/pid'
directory app_path
activate_control_app
