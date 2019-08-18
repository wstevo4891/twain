# app\views\api\v1\blogs\show.json.jbuilder

json.extract! @blog, :title, :description

json.type 'blog'

json.url "/blogs/#{@blog.slug}"

json.cover @blog.cover.url

json.articles @blog.articles.limit(5)
