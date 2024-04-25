json.extract! claim_request, :id, :user_id, :claim_request_type_id, :status, :amount, :created_at, :updated_at
json.url claim_request_url(claim_request, format: :json)
