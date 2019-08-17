# app\views\api\v1\blogs\index.json.jbuilder

json.array! @blogs do |blog|
  json.extract! blog, :name, :slug, :description

  json.type blog.class

  json.cover blog.cover.url

  json.url "/blogs/#{blog.slug}"
end
