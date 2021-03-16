## usersテーブル

|Column            |Type     |Options      |
|------------------|---------|-------------|
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | integer | null: false |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

|Column        |Type        |Options                         |
|--------------|------------|--------------------------------|
| item_name    | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| prefecture   | string     | null: false                    |
| delivery_day | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address_line  | integer    | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## addressテーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :order


