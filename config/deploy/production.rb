# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '00.00.000.000', user: 'naoki', roles: %w{app db web}

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/terraform_on_docker.pem' 
