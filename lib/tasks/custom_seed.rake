# lib\tasks\custom_seed.rake

# docker-compose run web rails db:seed:<seed file name>

namespace :db do
  desc 'Run all custom seed files'
  task all_custom_seeds: [:environment] do
    Dir[Rails.root.join('db/seeds/*.rb`')].each do |filename|
      load(filename) if File.exist?(filename)
    end
  end

  desc 'Seed a single table with custom script'
  task :custom_seed, [:filename] => [:environment] do |t, args|
    file = Rails.root.join("db/seeds/#{args.filename}.rb")

    load(file) if File.exist?(file)
  end

  # rails foo['bar','baz']
  # => Param1 is: bar
  # => Param2 is: baz
  desc 'Custom task to test using arguments'
  task :foo, [:param1, :param2] do |t, args|
    # ...
    puts "Param1 is: #{args.param1}"
    puts "Param2 is: #{args.param2}"
  end
end
