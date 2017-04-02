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
Attributes: id, url, last_run_at, created_at, updated_at

Model: product
Attributes: id, name, price, currency, created_at, updated_at

Model: reviews
Attributes: id, product_id, title, author, stars, body, created_at, updated_at


##### Stack
Ruby 2.2.5
Rails 4
Postgres (in production)
Sqlite3 (in development)

##### Flow:
- Ruby controller fetches URL's HTML data with Nokogiri,selecting DOM elements by CSS selectors.


Gems in use:
- https://github.com/sparklemotion/nokogiri
- https://github.com/jnunemaker/httparty

#### Why I this stack?
- RoR for fast MVC web-app, using generator
- HTTParty gem i'm familiar with, also a response time winner in comparison of 3 other gems
- Nokogiri parsing HTML made easy with CSS selectors
