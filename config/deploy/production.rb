# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '13.230.92.74', user: 'ec2-user', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/id_aws_rsa' 
