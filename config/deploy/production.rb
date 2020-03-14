# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '54.95.34.19', user: 'ec2-user', roles: %w{app db web}
