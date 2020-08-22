json.extract!(task, :id, :title, :description, :created_at, :updated_at, :line)
json.url(url_for([project, line, task, { format: :json }]))
