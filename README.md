# アプリケーション名

tech camp community app

# アプリケーションの概要

tech camp卒業生を対象としたアプリケーション。
記事を投稿することができ、仕事の悩み・技術内容など情報を共有する。

# URL

デプロイ次第、記述予定ß

# テスト用アカウント

email: test@est.com
pass:  20121117Ogawa

# 利用方法

tech campでのつながりを大切にしたい、この出会いをより強固にしたいといった方に利用して頂きたい。
転職後の仕事内容の悩み、エラー、記述内容など、記事として投稿する。

# 目指した課題解決

tech campを卒業した後、皆がばらばらになってしまうのは寂しい。
また、他の受講期の方とつながりがなかった。
より、つながりを求める方に、そのような機会を提供できた。

# 洗い出した要件

ユーザー管理機能
記事投稿機能
記事編集機能
記事詳細機能
記事削除機能
コメント機能

# image

[![Image from Gyazo](https://i.gyazo.com/e8e94256f7353a176854ce528728af70.png)](https://gyazo.com/e8e94256f7353a176854ce528728af70)

# 実装予定の機能

マイページ機能
Action Cableを用いたコメント機能
SNSアカウントを使ったログイン機能

# DB設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| time_to_attend  | integer | null: false | 
| classroom_id    | integer | null: false |
| course_style_id | integer | null: false |

### Association

- has_many :articles
- has_many :comments

## articles テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| title    | string     | null: false       |
| genre_id | integer    | null: false       |
| text     | text       | null: false       |
| user     | references | foreign_key: true |

### Association

- has_many :comments
- belong_to :user

## comments テーブル

| Column  | Type       | Options            |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :article