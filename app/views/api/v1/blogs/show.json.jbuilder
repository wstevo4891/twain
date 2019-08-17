# app\views\api\v1\blogs\show.json.jbuilder

json.extract! @blog, :name, :description

json.type @blog.class

json.url "/blogs/#{@blog.slug}"

json.cover @blog.cover.url

json.articles @blog.articles.limit(5)
