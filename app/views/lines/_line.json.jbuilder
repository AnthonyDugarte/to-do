json.extract! line, :id, :name, :created_at, :updated_at, :tasks

json.url url_for([project, line, format: :json])
