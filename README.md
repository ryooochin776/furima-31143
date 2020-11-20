## usersテーブル

| Column  |Type  | Options                 |
|---------|------|-------------------------|
|nickname |string|null: false              |
|email    |string|null: false, unique: true|
|password |string|null: false              |



### Association
has_many :products
has_many :purchases


## productsテーブル

| Column      | Type     | Options                       |
|-------------|--------- |-------------------------------|
|user         |references|null: false, foreign_key: true |
|product_name |string    |null: false                    |
|explanation  |text      |null: false                    |
|category     |string    |null: false                    |
|status       |string    |null: false                    |
|fee          |integer   |null: false                    |
|place        |string    |null: false                    |
|days         |integer   |null: false                    |
|price        |integer   |null: false                    |


### Association
belongs_to :user
has_one :purchase


## purchasesテーブル

| column      | Type     | Option                         |
|-------------|----------|--------------------------------|
|user         |references|null: false, foreign_key: true  |
|date         |integer   |null: false                     |
|product      |references|null: false, foreign_key: true  |


### Association
belongs_to :user
belongs_to :product
has_one :address


## addressesテーブル

| Column      | Type      | Option                        |
|-------------|-----------|-------------------------------|
|postal_code  |integer    |null: false                    |
|prefectures  |string     |null: false                    |
|municipality |string     |null: false                    |
|address      |integer    |null: false                    |
|phone_number |integer    |null: false                    |
|purchase     |references |null: false, foreign_key: true |

### Association 
belongs_to :purchase
