json.extract! to_do, :id, :name, :completed, :order, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)