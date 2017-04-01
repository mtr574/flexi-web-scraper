json.extract! review, :id, :product_id, :title, :author, :stars, :body, :created_at, :updated_at
json.url review_url(review, format: :json)