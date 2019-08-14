# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_asset_image(img)
  File.open(Rails.root.join("app/assets/images/#{img}"))
end

def seed_image_array(arr)
  arr.map { |img| seed_asset_image(img) }
end

def seed_aws_image(file)
  if Rails.env.production?
    "https://s3.amazonaws.com/portfolio-of-eric-stephenson/#{file}"
  else
    seed_asset_image(file)
  end
end

def create_date(arr)
  Date.new(arr[0], arr[1], arr[2])
end

def load_yaml(file)
  YAML.load_file(Rails.root.join("db/yaml_data/#{file}.yml"))
end

# PROJECTS
# =========================================================

Project.delete_all

puts 'Loading projects...'

projects = load_yaml('projects')

projects.each do |project|
  puts "Creating project: #{project['title']}"

  Project.create!(
    title: project['title'],
    slug: project['slug'],
    cover: seed_asset_image(project['cover']),
    images: seed_image_array(project['images']),
    desktop: seed_asset_image(project['desktop']),
    mobile: seed_image_array(project['mobile']),
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
end

puts 'Projects created!'

# BLOGS
# =========================================================

Blog.delete_all

puts 'Loading blogs...'

blogs = load_yaml('blogs')

blogs.each do |blog|
  puts "Creating blog: #{blog['name']}"

  Blog.create!(
    name: blog['title'],
    slug: blog['title'].downcase.tr(' ', '-'),
    cover: seed_asset_image(blog['cover']),
    description: blog['description']
  )
end

puts 'Blogs loaded!'

# ARTICLES
# =========================================================

Article.delete_all

puts 'Loading articles...'

articles = load_yaml('articles')

articles.each do |article|
  Article.create!(
    title: article['title'],
    blog_id: Blog.find_by(name: article['blog']).id,
    slug: article['slug'],
    meta_title: article['meta_title'],
    meta_description: article['meta_description'],
    summary: article['summary'],
    cover: article['cover']
  )
end

puts 'Articles loaded!'
