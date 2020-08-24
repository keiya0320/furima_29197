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
- has_many :comments

## products テーブル
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| product_photo       | text    | null: false |
| product_name        | string  | null: false |
| explanation         | text    | null: false |
| category            | string  | null: false |
| condition           | string  | null: false |
| delivery_fee        | string  | null: false |
| shipping_origin     | string  | null: false |
| days_until_shipping | string  | null: false |
| value               | integar | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase_info

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user

## purchase_info テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_data     | integar | null: false |
| card_deadline | integar | null: false |
| security_code | integar | null: false |
| postal_code   | integar | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | integar | null: false |

### Association

- belongs_to :product