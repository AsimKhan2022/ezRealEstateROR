json.extract! article, :id, :title, :story, :images, :headlines, :sub_title, :admin_id, :created_at, :updated_at
json.url article_url(article, format: :json)
