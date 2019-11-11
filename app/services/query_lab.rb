# Custom SQL Query
class QueryLab
  def self.call
    # genres_list
    # movies_index
    action_movie_titles
  end

  def self.action_movies
    Movie.connection.select_all(
      <<-SQL
        SELECT title FROM movies
        INNER JOIN genres_movies
          ON movies.id = genres_movies.movie_id
        WHERE genres_movies.genre_id = 1
        ORDER BY movies.title
        LIMIT 50
      SQL
    ).to_a
  end

  def self.action_movie_titles
    Movie.joins(:genres).where(genres: { title: 'Action' }).pluck(:title)
  end

  def self.genres_list
    Genre.find_by_sql(
      <<-SQL
        SELECT genres.title FROM genres
        INNER JOIN genres_movies
          ON genres.id = genres_movies.genre_id
        WHERE genres_movies.movie_id = 91
        LIMIT 3
      SQL
    ).map(&:title)
  end

  def self.movies_index
    Movie.find_by_sql(
      <<-SQL
        SELECT * FROM movies, title FROM genres
        INNER JOIN genres_movies
          ON genres_movies.genre_id = genre.id
          AND genres_movies.movie_id = movie.id
        ORDER BY movies.title
      SQL
    )
  end

  def self.not_managed_by(name)
    joins(
      <<-SQL
        LEFT JOIN people managers
        ON managers.id = people.manager_id
      SQL
    ).where(
      'managers.id != ? OR managers.id IS NULL',
      Person.find_by(name: name)
    )
  end
end

# Doesn't Work
# SELECT * FROM movies
# LEFT JOIN genres ON genres.title IN movies.genres
# ORDER BY movies.title
