# REST API documentation

## Installation

1. Clone `git clone https://github.com/muhenge/AZA.git`
2. Open project directory
3. Run `bundle install`
4. Run `rails server` to start the project

#### API

##### POST `/api/signup`

###### Sample body

`{"customer":{         "username":"dada",         "email":"dada@g.com",         "password":"password",         "password_confirmation":"password",         "country":"Uganda"     }}`

##### POST `/api/login`

###### Sample body

`{"customer":{ "email":"dada@g.com","password":"password","password_confirmation":"password","country":"Uganda" }}`

##### POST `/api/transactions`

###### Sample body

`{"transaction":{ "input_amount":10000,"in_currency":"CAD","out_currency":"USD" }}`

###### GET `/api/transactions`

###### GET `/api/transations/{id}`
