## Web scrapper

##### Motivation:
1. Fetch product & reviews data from given URL, in this example Walmart.com
2. Store these models in Database
3. Present the data and allow filtering

- Each model should be unique!

Optionals:
- Rerun scrapper on product will update product & reviews data

### Architecture

##### DB Design
Model: source
Attributes: id, url, script, last_run_at, created_at, updated_at

Model: product
Attributes: id, name, price, currency, created_at, updated_at

Model: reviews
Attributes: id, product_id, title, author, stars, body, created_at, updated_at


##### Stack
Ruby 2.2.5
Rails 4
Postgres
Sqlite3

##### Flow:
- Ruby micro-service fetches URL's data, runs JavaScript (execJS) to fetch the current data with lodash - it provides flexible DOM control.
- the service returns JSON formatted object with the parsed data.

##### UI
AngularJS tables with filters for reviews by keyword

Gems in use:
- https://github.com/sstephenson/execjs
- https://github.com/jnunemaker/httparty

#### Why I this stack?
- RoR for fast MVC building (with generators)
- HTTParty gem i'm familiar with, also a response time winner in comparison of 3 gems
- Nokogiri
