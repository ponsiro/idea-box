# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| image_name         | string  |                           |


### Association

- has_many :ideas
- has_many :comments
- has_many :likes

## ideas テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| content                | string    | null: false                    |
| user                   | reference | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes
- has_many :comments
- has_many :idea_tags
- has_many :tags, through: idea_tags


## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user      | reference | null: false, foreign_key: true |
| idea      | reference | null: false, foreign_key: true |
| text      | string    | null: false                    |

### Association

- belongs_to :user
- belongs_to :idea



## likes テーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| idea     | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
_ belongs_to :idea

## tagsテーブル

| Column   | Type      | Options     |
| -------- | --------- | ------------|
| name     | string    |             |

### Association

- has_many :idea_tags
- has_many :ideas, through: idea_tags

## idea_tagsテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| item     | reference | null: false, foreign_key: true |
| tag      | reference | null: false, foreign_key: true |

### Association

- belongs_to :idea
- belongs_to :tag