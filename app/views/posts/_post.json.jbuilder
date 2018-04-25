json.extract! post, :id, :content, :image, :is_stylist, :created_at, :updated_at
json.url post_url(post, format: :json)
