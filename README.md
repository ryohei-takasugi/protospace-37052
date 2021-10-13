# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string | null: false, ユニーク制約 |
| encrypted_password | string | null: false             |
| name               | string | null: false             |
| profile            | text   | null: false             |
| occupation         | text   | null: false             |
| position           | text   | null: false             |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column      | Type       | Options              |
| ----------- | -----------| -------------------- |
| title       | string     | null: false          |
| catch_copy  | string     | null: false          |
| concept     | text       | null: false          |
| user        | references | null: false, 外部キー |

* imageはActiveStorageで実装するため含まない

### Association

- belongs_to :users
- has_many :comments


## comments テーブル

| Column    | Type       | Options                |
| --------- | -----------| ---------------------- |
| content   | text       | null: false            |
| prototype | references | null: false, 外部キー   |
| user      | references | null: false, 外部キー   |


### Association

- belongs_to :users
- belongs_to :prototypes
