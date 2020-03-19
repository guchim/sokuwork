# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server 'terrarform-on-docker-alb-111067836.ap-northeast-1.elb.amazonaws.com', user: 'ec2-user', roles: %w{app db web}
