require 'bundler/capistrano'

# be sure to change these
set :user, 'satq'
set :domain, '85.214.129.63'
set :port, 2205
set :application, 'satq'
   
# file paths
set :repository,  "https://github.com/mxey/satq.git" 
set :deploy_to, "/srv/satq" 
 
# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true
 
# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true
 
# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'
 
# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

require 'capistrano-unicorn'
