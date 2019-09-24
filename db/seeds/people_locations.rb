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
