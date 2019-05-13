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
  File.open(Rails.root + "app/assets/images/#{img}")
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

# posts = load_yaml('posts')

# Post.delete_all

# puts 'Loading posts ============================'

# posts.each do |post|
#   puts "Loading post: #{post['title']}"

#   new_post = Post.create!(
#     meta_title: post['meta_title'],
#     meta_description: post['meta_description'],
#     title: post['title'],
#     slug: post['slug'],
#     date: create_date(post['date']),
#     cover: seed_asset_image(post['cover']),
#     description: post['description']
#   )

#   post['sections'].each do |section|
#     new_post.sections.create!(
#       header: section['header'],
#       image: section['image'],
#       body: section['body']
#     )
#   end
# end

Project.delete_all

puts 'Loading projects ========================='

projects = load_yaml('projects')

projects.each do |project|
  puts "Loading project: #{project['title']}"

  Project.create!(
    meta_title: project['meta_title'],
    meta_description: project['meta_description'],
    title: project['title'],
    slug: project['slug'],
    cover: seed_asset_image(project['cover']),
    site_link: project['site_link'],
    repo_link: project['repo_link'],
    summary: project['summary'],
    highlights: project['highlights'],
    tech_stack: project['tech_stack']
  )
end
