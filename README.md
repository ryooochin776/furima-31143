## usersテーブル

| Column  |Type   | Options                 |
|---------|-------|-------------------------|
|nickname |string |null: false              |
|email    |string |null: false, unique: true|
|password |string |null: false              |
|name     |string |null: false              |
|birthday |integer|null: false              |



### Association   
has_many :products
has_many :purchases


## productsテーブル

| Column      | Type     | Options                       |
|-------------|--------- |-------------------------------|
|user         |references|null: false, foreign_key: true |
|product_name |string    |null: false                    |
|explanation  |text      |null: false                    |
|category     |integer   |null: false                    |
|status       |integer   |null: false                    |
|fee          |integer   |null: false                    |
|place        |integer   |null: false                    |
|days         |integer   |null: false                    |
|price        |integer   |null: false                    |


### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

| column      | Type     | Option                         |
|-------------|----------|--------------------------------|
|user         |references|null: false, foreign_key: true  |
|product      |references|null: false, foreign_key: true  |


### Association
belongs_to :user
belongs_to :product
has_one :address


## addressesテーブル

| Column      | Type      | Option                        |
|-------------|-----------|-------------------------------|
|postal_code  |string     |null: false                    |
|prefectures  |integer    |null: false                    |
|municipality |string     |null: false                    |
|address      |integer    |null: false                    |
|phone_number |string     |null: false                    |
|purchase     |references |null: false, foreign_key: true |
|building     |string     |null: false                    |

### Association 
belongs_to :purchase
