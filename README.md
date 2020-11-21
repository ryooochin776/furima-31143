## usersテーブル

| Column            |Type               | Options                 |
|-------------------|-------------------|-------------------------|
|nickname           |string             |null: false              |
|email              |string             |null: false, unique: true|
|encrypted_password |string             |null: false              |
|last_name          |string             |null: false              |
|first_name         |string             |null: false              |
|last_name(kana)    |string             |null: false              |
|first_name(kana)   |string             |null: false              |
|birthday           |integer            |null: false              |



### Association   
has_many :products
has_many :purchases


## productsテーブル

| Column         | Type     | Options                       |
|----------------|--------- |-------------------------------|
|user            |references|foreign_key: true              |
|name            |string    |null: false                    |
|explanation     |text      |null: false                    |
|category_id     |integer   |null: false                    |
|status_id       |integer   |null: false                    |
|fee_id          |integer   |null: false                    |
|place_id        |integer   |null: false                    |
|days_id         |integer   |null: false                    |
|price           |integer   |null: false                    |


### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

| column      | Type     | Option                         |
|-------------|----------|--------------------------------|
|user         |references|foreign_key: true               |
|product      |references|foreign_key: true               |


### Association
belongs_to :user
belongs_to :product
has_one :address


## addressesテーブル

| Column         | Type      | Option                        |
|----------------|-----------|-------------------------------|
|postal_code     |string     |null: false                    |
|prefectures_id  |integer    |null: false                    |
|municipality    |string     |null: false                    |
|address         |integer    |null: false                    |
|phone_number    |string     |null: false                    |
|purchase        |references |null: false, foreign_key: true |
|building        |string     |                               |

### Association 
belongs_to :purchase
