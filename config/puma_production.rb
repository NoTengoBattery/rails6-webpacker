project_name = "website"

# The environment this Puma is going to run on
environment ENV.fetch("RAILS_ENV") { "production" }
directory "/www/sites/#{project_name}/current"

# Execute in daemon mode (deprecated, using shell nohup)
# daemonize true

# Bind to this UNIX socket for server, control
bind "unix:///www/sites/#{project_name}/shared/tmp/sockets/puma.sock"
activate_control_app "unix:///www/sites/#{project_name}/shared/tmp/sockets/pumactl.sock"

# Use this state path, pidfile
state_path "/www/sites/#{project_name}/shared/tmp/sockets/puma.state"
pidfile "/www/sites/#{project_name}/shared/tmp/pids/puma.pid"

# Redirect output to this file for out and err
stdout_redirect("/www/sites/#{project_name}/shared/log/puma.log",
                "/www/sites/#{project_name}/shared/log/puma.err.log")

# Other configuration
max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
concurrency_workers = ENV.fetch("WEB_CONCURRENCY", 2)

workers concurrency_workers
threads min_threads_count, max_threads_count
quiet
preload_app!
