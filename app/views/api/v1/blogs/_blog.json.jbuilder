# app\views\api\v1\blogs\_blog.json.jbuilder

json.extract! blog, :name, :description

json.url "/blogs/#{blog.slug}"

json.cover blog.cover.url
