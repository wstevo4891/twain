# app\views\api\v1\articles\show.json.jbuilder

json.extract! @article,
              :title, :slug, :meta_title, :meta_description,
              :summary, :date, :content

json.type 'article'

json.cover @article.cover.url
