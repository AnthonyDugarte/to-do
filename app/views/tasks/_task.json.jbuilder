json.extract! task, :id, :title, :description, :created_at, :updated_at, :line
json.url url_for([line, task, format: :json])
