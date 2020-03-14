# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.95.34.19', user: 'ec2-user', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/id_aws_rsa'
