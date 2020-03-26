# 即WORK
人手不足の今日、面接いらず、即戦力でバイトを募集し、働くことのできるマッチングサービスです。<br>
就職活動用のポートフォリオとして制作致しました。<br>
![スクリーンショット 2020-03-02 23 36 38](https://user-images.githubusercontent.com/54785182/75742784-16d54b00-5d52-11ea-8671-bf4262f81af0.png)

# リンク
- http://sokuwork.xyz/<br>
ログインページの下部の、テストログインボタンから、サンプルユーザーとしてログインできます。<br>
※現在企業側のページにおいて新規登録できない状況にあります。テストログインでの使用をお願いします。早期解決を目指しております。
# 使用技術

- Ruby 2.6.３
- Ruby on Rails 5.2.4.1
- MySQL2
- Nginx
- unicorn
- AWS
  - VPC
  - EC2
  - RDS
  - S3
  - ALB
  - Route53
  - ACM（証明書取得中）
- Docker
- Terraform
- Ansible
- CircleCI
- Capistrano
- RSpec(テスト更新中)


# クラウドアーキテクチャ
![Untitled Diagram (1)](https://user-images.githubusercontent.com/54785182/77249271-37befb00-6c83-11ea-9e5a-5d416c4233f8.png)

# 機能一覧、使用したGemなど
- ユーザー登録、ログイン機能(devise)
- 画像アップロード機能(carrierwave)
- 求人募集要項、作成/削除機能
- 求人募集要項、詳細表示機能
- 募集要項検索機能（ransack）
- ページネーション（kaminari）<br>
その他機能は随時更新していきます
