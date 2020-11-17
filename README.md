# README


## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | unique: true |
|   email  | string | unique: true |
| password | string | unique: true |
|   name   | string | null: false  |
| birthday | string | null: false  |

### Association
has_many :items
has_many :purchase
has_one :address


## items テーブル

|   Column  |   Type   | Options                        |
| --------- | -------- | ------------------------------ |
| item_name |  string  | null: false                    |
|explanation|   text   | null: false                    |
| category  |  string  | null: false                    |
| shipping  |  string  | null: false                    |
|   area    |  string  | null: false                    |
| day_ship  |  string  | null: false                    |
|   price   |  integer | null: false                    |
|   user    |references| null: false, foreign_key: true |

belong_to :user
has_one :purchase



## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|  day   |  datetime  | null: false                    |
|  user  | references | null: false, foreign_key: true |
|  item  | references | null: false, foreign_key: true |

### Association
belong_to :user
belong_to :item
has_one :address


## addresses テーブル

|    Column   |    Type    | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code |   integer  | null: false                    |
| prefecture  |   string   | null: false                    |
|     city    |   string   |  null: false                   |
| address_num |   string   |null: false                     |
|building_name|   string   | null: false                    |
|    phone    |   integer  | null: false                    |
|    user     | references | null: false, foreign_key: true |

### Association
belong_to :purchase
belong_to :user