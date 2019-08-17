# app\views\api\v1\blogs\show.json.jbuilder

json.extract! @blog, :name, :description

json.url "/blogs/#{@blog.slug}"

json.cover @blog.cover.url

json.articles @blog.articles.limit(5)
