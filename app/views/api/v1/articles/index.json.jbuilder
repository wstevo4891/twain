# app\views\api\v1\articles\index.json.jbuilder

json.array! @articles do |article|
  json.extract! article,
                :title, :slug, :meta_title, :meta_description,
                :summary, :date, :content

  json.type article.class

  json.cover article.cover.url
end
