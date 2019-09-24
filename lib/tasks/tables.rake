# lib/tasks/tables.rake

namespace :tables do
  # docker-compose run web rake tables:reset[<table name>]
  desc "Reset a single database table"
  # task :json, [:genre] => [:environment] do |t, args|
  #   file = Rails.root.join('test/javascript/fixtures', "#{args[:genre].downcase}.json")
  #   puts "file: #{file}"

  #   puts 'Loading movies =================================='
  #   movies = Genre.where(name: args[:genre]).first.movies
  #   puts movies.first.inspect

  #   h = JSON.parse(movies.to_json)

  #   File.open(file, 'w+') do |f|
  #     f.write(JSON.pretty_generate(h))
  #   end
  end