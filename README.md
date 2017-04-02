## Web scrapper

#### Motivation:
1. Fetch product & reviews data from given URL, in this example Walmart.com
2. Store these models in Database
3. Present the data and allow filtering

#### Usage
- clone it
`git clone https://github.com/mtr574/flexi-web-scraper`
- bundle it
`bundle`
- migrate it
`rake db:migrate RAILS_ENV=development`
- run it
`rails s`

- you can test with local file copied from walmart's website
`http://localhost:3000/walmart_product.html`


#### Architecture

##### DB Design
- Model: source
- Attributes: id, url, last_run_at, created_at, updated_at

- Model: product
- Attributes: id, name, price, currency, created_at, updated_at

- Model: reviews
- Attributes: id, product_id, title, author, stars, body, created_at, updated_at

##### Stack
- Ruby 2.2.5
- Rails 4
- Postgres (in production)
- Sqlite3 (in development)

##### Flow:
- Source controller has method that fetches URL's HTML data
- with Nokogiri gem selecting DOM elements by CSS selectors and plot their values
- Product and its reviews created only if product doesn't already exists, looked-up by product title, and updated if found in the DB

##### Gems in use:
- https://github.com/sparklemotion/nokogiri
- https://github.com/jnunemaker/httparty

#### Why I this stack?
- RoR for fast MVC web-app, using generator
- HTTParty gem i'm familiar with, also a response time winner in comparison of 3 other gems
- Nokogiri parsing HTML made easy with CSS selectors

#### Downsides
- work's only for Walmart website, could be more flexible with CSS selectors in DB
- coul'd use async fetch for better UI/UX
