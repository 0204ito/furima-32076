# README


## users テーブル

|        Column      |  Type  | Options      |
| ------------------ | ------ | ------------ |
|       nickname     | string | unique: true |
|        email       | string | unique: true |
| encrypted_password | string | unique: true |
|     family_name    | string | null: false  |
|      given_name    | string | null: false  |
|  family_name_kana  | string | null: false  |
|  given_name_kana   | string | null: false  |
|      birthday      |  date  | null: false  |

### Association
has_many :items
has_many :purchases


## items テーブル

|          Column         |   Type   | Options                        |
| ----------------------- | -------- | ------------------------------ |
|            name         |  string  | null: false                    |
|            info         |   text   | null: false                    |
|     sales_status_id     |  integer | null: false                    |
|        category_id      |  integer | null: false                    |
| shipping_free_status_id |  integer | null: false                    |
|      prefecture _id     |  integer | null: false                    |
|  scheduled_delivery_id  |  integer | null: false                    |
|           price         |  integer | null: false                    |
|            user         |references| null: false, foreign_key: true |

belong_to :user
has_one :purchase




## purchases テーブル

| Column |    Type    | Options                        |
| ------ | ---------- | ------------------------------ |
|  user  | references | null: false, foreign_key: true |
|  item  | references | null: false, foreign_key: true |

### Association
belong_to :user
belong_to :item
has_one :address



## addresses テーブル

|    Column   |    Type    | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code |  integer   | null: false                    |
|prefecture_id|  integer   | null: false                    |
|     city    |   string   | null: false                    |
| house_number|   string   | null: false                     |
|building_name|   string   |                                |
|    phone    |   string   | null: false                    |
|    purchase     | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
