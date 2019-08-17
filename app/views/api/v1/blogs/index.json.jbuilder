# app\views\api\v1\blogs\index.json.jbuilder

json.extract! @blog, :name, :slug, :description

json.url "/blogs/#{@blog.slug}"

json.cover @blog.cover.url
