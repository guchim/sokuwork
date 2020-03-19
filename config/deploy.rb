# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
# Gem.lockファイル内にcapstranoのバージョンの記載あり
lock '3.11.2'

set :deploy_to, '/var/www/sokuwork'

# Capistranoのログの表示に利用する
set :application, 'sokuwork'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:guchim/sokuwork.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push("config/master.key")

#ターミナル上、ruby -vでチェックできます。
set :rbenv_type, :user
set :rbenv_ruby, '2.6.3'

# どの公開鍵を利用してデプロイするか。
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/id_aws_rsa']

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

#AWSのELB(Elastic+Load+Balancing)配下にあるEC2インスタンスを取得
require 'aws-sdk'

AWS.config({
  :access_key_id     => ENV["AWS_ACCESS_KEY_ID"],
  :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
  :ec2_endpoint      => "ec2.ap-northeast-1.amazonaws.com",
  :elb_endpoint      => "elasticloadbalancing.ap-northeast-1.amazonaws.com"
})
elb = AWS::ELB.new.load_balancers['terrarform-on-docker-alb']
instances = elb.instances.select {|i| i.exists? && i.status == :running}.map(&:dns_name)

role :app, *instances

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
