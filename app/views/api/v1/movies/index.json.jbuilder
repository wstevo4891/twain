# app/views/api/movies/index.json.jbuilder

# Generated index jbuilder
json.array!(@movies) do |movie|
  json.extract! movie,
                :id, :title, :slug, :photo, :year, :rated,
                :run_time, :plot, :ratings, :genre_ids

  json.url movie_url(movie.slug)
end
