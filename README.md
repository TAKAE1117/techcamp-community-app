# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| email          | string  | null: false |
| password       | string  | null: false |
| nickname       | string  | null: false |
| time_to_attend | integer | null: false | 
| classroom      | integer | null: false |
| course_style   | integer | null: false |

### Association

- has_many :articles
- has_many :comments

## articles テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| genre  | integer    | null: false       |
| text   | text       | null: false       |
| user   | references | foreign_key: true |

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