json.extract! question, :id, :title, :type, :topic_id, :user_id, :created_at, :updated_at
json.url question_url(question, format: :json)
