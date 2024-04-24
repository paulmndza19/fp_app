json.extract! contribution, :id, :user_id, :amount, :month, :year, :created_at, :updated_at
json.url contribution_url(contribution, format: :json)
