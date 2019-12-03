# db/seeds.rb

GENRE_IDS_MAP = {
  'Action' => 1,
  'Adventure' => 2,
  'Comedy' => 3,
  'Drama' => 4,
  'Animation' => 5,
  'Family' => 6,
  'Romance' => 7,
  'Fantasy' => 8,
  'Sci-Fi' => 9,
  'Horror' => 10
}.freeze

def genre_ids_array(genres)
  arr = genres.split(', ')

  arr.map { |name| GENRE_IDS_MAP[name] }
end

def bolt_network_image(file)
  "https://bolt-network.s3-us-west-2.amazonaws.com/#{file}"
end

def portfolio_image(file)
  "https://portfolio-of-eric-stephenson.s3.amazonaws.com/#{file}"
end

def poster_file(path)
  path[%r{/[\w-]+\.yml}].slice(1..-1).sub('.yml', '-poster.jpg')
end

def movie_slug(path)
  path[%r{/[\w-]+\.yml}].slice(1..-5)
end

def portfolio_image_array(arr)
  arr.map { |img| portfolio_image(img) }
end

def create_date(arr)
  Date.new(arr[0], arr[1], arr[2])
end

def load_yaml(file)
  YAML.load_file(Rails.root.join("db/yaml_data/#{file}.yml"))
end

def load_movie(path)
  YAML.load_file(Rails.root.join(path))
end

def genres_short_list(genres)
  genres.split(', ').take(3)
end

def movie_params(movie, poster_file)
  {
    title: movie['Title'],
    year: movie['Year'],
    rated: movie['Rated'],
    release_date: movie['Released'],
    run_time: movie['Runtime'],
    directors: movie['Director'].split(', '),
    writers: movie['Writer'].split(', '),
    actors: movie['Actors'].split(', '),
    plot: movie['Plot'],
    remote_photo_url: bolt_network_image(poster_file),
    poster: movie['Poster'],
    ratings: { ratings: movie['Ratings'] },
    genres_list: genres_short_list(movie['Genre']),
    genre_ids: genre_ids_array(movie['Genre'])
  }
end

# =============================================================================
# SEEDS SCRIPT
# =============================================================================

puts 'Seeding the Database...'

# PROJECTS
# =========================================================

puts 'Deleting old Projects...'
Project.delete_all

puts 'Loading projects...'

projects = load_yaml('projects')

projects.each do |project|
  puts "Creating project: #{project['title']}"

  begin
    Project.create!(
      title: project['title'],
      slug: project['slug'],
      remote_cover_url: portfolio_image(project['cover']),
      remote_images_urls: portfolio_image_array(project['images']),
      remote_desktop_url: portfolio_image(project['desktop']),
      remote_mobile_urls: portfolio_image_array(project['mobile']),
      meta_title: project['meta_title'],
      meta_description: project['meta_description'],
      summary: project['summary'],
      site_link: project['site_link'],
      repo_link: project['repo_link'],
      description: project['description'],
      features: project['features'],
      apis: project['apis'],
      tech_stack: project['tech_stack']
    )
  rescue StandardError => e
    puts 'ERROR'
    puts e.message
    puts portfolio_image(project['cover'])
    puts portfolio_image_array(project['images'])
    puts portfolio_image(project['desktop'])
    puts portfolio_image_array(project['mobile'])
  end
end

puts 'Projects created!'

# BLOGS
# =========================================================

puts 'Deleting old Blogs...'
Blog.delete_all

puts 'Loading blogs...'

blogs = load_yaml('blogs')

blogs.each do |blog|
  puts "Creating blog: #{blog['title']}"

  cover = portfolio_image(blog['cover'])

  begin
    Blog.create!(
      title: blog['title'],
      slug: blog['title'].downcase.tr(' ', '-'),
      remote_cover_url: cover,
      description: blog['description']
    )
  rescue StandardError => e
    puts 'ERROR'
    puts e.message
    puts cover
  end
end

puts 'Blogs created!'

# ARTICLES
# =========================================================

puts 'Deleting old Articles...'
Article.delete_all

puts 'Loading Articles...'

articles = load_yaml('articles')

articles.each do |article|
  cover = portfolio_image(article['cover'])

  begin
    Article.create!(
      title: article['title'],
      blog_id: Blog.find_by(title: article['blog']).id,
      slug: article['slug'],
      meta_title: article['meta_title'],
      meta_description: article['meta_description'],
      summary: article['summary'],
      remote_cover_url: cover
    )
  rescue StandardError => e
    puts 'ERROR'
    puts e.message
    puts cover
  end
end

puts 'Articles created!'

# Genres
# =========================================================

puts 'Deleting old Genres...'
Genre.delete_all

puts 'Loading Genres...'
genres = load_yaml('genres')

puts 'Creating Genres...'
genres.each do |genre|
  puts "Creating genre: #{genre['title']}"

  Genre.create!(genre)
end

puts 'Genres created!'

# Movies
# =========================================================

puts 'Deleting old Movies...'
Movie.delete_all

puts 'Loading Movies...'
Dir['db/yaml_data/movies/*.yml'].each do |path|
  movie = load_movie(path)
  poster_file = poster_file(path)

  params = movie_params(movie, poster_file)
  params[:slug] = movie_slug(path)
  params[:remote_banner_url] = bolt_network_image(movie['Banner']) if movie['Banner']
  params[:remote_logo_url] = bolt_network_image(movie['Logo']) if movie['Logo']

  Movie.create!(params)

  puts "Created Movie: #{movie['Title']}"
end

puts 'Movies created!'

# Roles
# =========================================================

puts 'Deleting old Roles...'
Role.delete_all

puts 'Loading Roles...'
roles = load_yaml('roles')

puts 'Creating Roles...'
roles.each do |role|
  puts "Creating role: #{role['name']}"

  Role.create!(role)
end

puts 'Roles created!'

# Regions
# =========================================================

puts 'Deleting old Regions...'
Region.delete_all

puts 'Loading Regions...'
regions = load_yaml('regions')

puts 'Creating Regions...'
regions.each do |region|
  puts "Creating region: #{region['name']}"

  Region.create!(region)
end

puts 'Regions created!'

# Locations
# =========================================================

puts 'Deleting old Locations...'
Location.delete_all

puts 'Loading Locations...'
locations = load_yaml('locations')

puts 'Creating Locations...'
locations.each do |location|
  puts "Creating location: #{location['name']}"

  Location.create!(location)
end

puts 'Locations created!'

# People
# =========================================================

puts 'Deleting old People...'
Person.delete_all

puts 'Loading People...'
people = load_yaml('people')

puts 'Creating People...'
people.each do |person|
  puts "Creating person: #{person['name']}"

  Person.create!(person)
end

puts 'People created!'

puts 'Seeding Database Complete!'
