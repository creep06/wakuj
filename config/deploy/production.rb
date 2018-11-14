set :rails_env, "production"
set :unicorn_rack_env, "production"
set :pty, false

role :app, %w{vagrant@192.168.33.40}
role :web, %w{vagrant@192.168.33.40}
role :db,  %w{vagrant@192.168.33.40}

server '192.168.33.40', user: 'vagrant', roles: %w{web app}

set :ssh_options, {
  keys: %w(/home/vagrant/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}
