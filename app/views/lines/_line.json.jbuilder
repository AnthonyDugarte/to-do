json.extract! line, :id, :name, :created_at, :updated_at, :tasks

json.url line_url(line, format: :json)
