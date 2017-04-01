json.extract! source, :id, :url, :script, :last_run_at, :created_at, :updated_at
json.url source_url(source, format: :json)