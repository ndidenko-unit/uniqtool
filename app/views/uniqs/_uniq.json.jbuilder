json.extract! uniq, :id, :request, :result, :created_at, :updated_at
json.url uniq_url(uniq, format: :json)
