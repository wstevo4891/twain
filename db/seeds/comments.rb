# Custom Seed Comments

puts 'Seeding Comments...'

file = Rails.root.join('db/yaml_data/comments.yml')

comments = YAML.load_file(file)

comments.each do |data|
  Comment.create(data)
end

puts 'Comments created!'
