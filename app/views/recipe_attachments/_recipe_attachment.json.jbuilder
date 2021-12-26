json.extract! recipe_attachment, :id, :recipe_id, :image, :created_at, :updated_at
json.url recipe_attachment_url(recipe_attachment, format: :json)
