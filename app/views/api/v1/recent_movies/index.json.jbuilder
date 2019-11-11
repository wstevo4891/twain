# app/views/api/movies/recent/show.json.jbuilder

json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :slug, :poster, :photo, :year, :rated, :run_time,
                :plot, :ratings, :release_date, :directors, :writers, :actors

  json.url "/movies/#{movie.slug}"

  json.genres movie.genres_list
end
