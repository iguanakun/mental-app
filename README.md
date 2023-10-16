# データベース設計

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :monitorings
- has_many :temptations

## monitorings テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| fact       | text       |                                |
| mind       | text       |                                |
| feel       | text       |                                |
| body       | text       |                                |
| behavior   | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## temptations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| event      | text       |                                |
| talk       | text       |                                |
| pay_price  | text       |                                |
| get_out    | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user