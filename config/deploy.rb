lock '3.4.0' # config valid only for current version of Capistrano

set :application, 'menubook'
set :repo_url, 'git@github.com:mfebrianto/menubook.git'

# set :ssh_options, {:forward_agent => true}

set :user, 'f2'
set :stages, ['staging', 'production']
set :default_stage, 'staging'

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.2.1@menubook'      # Defaults to: 'default'
# set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected

# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp # Default branch is :master
# set :scm, :git # Default value for :scm is :git
# set :deploy_to, '/var/www/my_app_name' # Default deploy_to directory is /var/www/my_app_name
# set :format, :pretty # Default value for :format is :pretty
# set :log_level, :debug # Default value for :log_level is :debug
# set :pty, true # Default value for :pty is false
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml') # Default value for :linked_files is []
# set :default_env, { path: "/opt/ruby/bin:$PATH" } # Default value for default_env is {}
# set :keep_releases, 5 # Default value for keep_releases is 5


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
