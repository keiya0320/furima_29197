# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name  | string | null: false |
| family_name | string | null: false |
| read_first  | string | null: false |
| read_family | string | null: false |
| birth       | date   | null: false |

### Association

- has_many :products
- has_many :item_purchases
- has_many :comments

## products テーブル
| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| photo               | text       | null: false |
| name                | string     | null: false |
| explanation         | text       | null: false |
| category            | integer    | null: false |
| condition           | integer    | null: false |
| postage_type        | integer    | null: false |
| prefectures         | integer    | null: false |
| preparation_days    | integer    | null: false |
| value               | integar    | null: false |
| user                | references | null: false | 


### Association

- belongs_to :user
- belongs_to :item_purchase
- has_many :comments
- has_one :purchase_info
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :preparation_days
- belongs_to :seller, class_name: "User"


## item_purchases テーブル
| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| product       | integer | null: false, foreign_key: true |
| user          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :product


## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | integer    | null: false, foreign_key: true |
| product | integer    | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| item_purchase | integer    | null: false, foreign_key: true |

### Association

- has_one_active_hash :prefectures