json.extract! task, :id, :title, :description, :created_at, :updated_at, :line
json.url task_url(task, format: :json)
