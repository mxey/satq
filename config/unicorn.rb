worker_processes 4
timeout 30
preload_app true
working_directory "/srv/satq/current"
listen "localhost:8080"
pid "/srv/satq/current/tmp/pids/unicorn.pid"

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  sleep 1
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end
end