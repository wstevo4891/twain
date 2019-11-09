# app\views\api\v1\movies_index\show.json.jbuilder

@movies_index.each do |genre, list|
  json.set! genre do
    json.array! list do |movie|
      json.extract! movie,
                    :id, :title, :slug, :poster, :photo, :year, :rated,
                    :run_time, :plot, :ratings, :release_date, :directors,
                    :writers, :actors

      json.url "/movies/#{movie.id}"

      json.genres movie.genres_list
    end
  end
end
