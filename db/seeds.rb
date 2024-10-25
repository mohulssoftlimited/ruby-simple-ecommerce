# Clear existing records
if ENV['SEED_TYPE'] == 'products'
  Category.destroy_all
  Product.destroy_all

  # Create categories and products
  100.times do
    category = Category.create(
      name: Faker::Commerce.department,
      description: Faker::Lorem.sentence
    )

    50.times do
      category.products.create(
        name: Faker::Commerce.product_name,
        price: Faker::Commerce.price(range: 10.0..100.0),
        description: Faker::Lorem.paragraph,
        stock_count: Faker::Number.between(from: 1, to: 100)
      )
    end
  end
elsif ENV['SEED_TYPE'] == 'breeds'
  Breed.destroy_all
  BreedGroup.destroy_all

  require 'httparty'

  api_url = 'https://api.thedogapi.com/v1/breeds?limit=800'
  headers = {
    'x-api-key' => 'live_SvIqA9KzpZ4YyOflEyIhqWMk3cPnoiUO9PbWEb64rVhPlyPaWPoLaLufQNZtRbNf',
    'authorization' => 'live_SvIqA9KzpZ4YyOflEyIhqWMk3cPnoiUO9PbWEb64rVhPlyPaWPoLaLufQNZtRbNf'
  }

  response = HTTParty.get(api_url, headers: headers)

  if response.success?
    breeds_data = response.parsed_response

    breeds_data.each do |breed_data|
      # Skip if breed_group is missing
      next unless breed_data["breed_group"].present?

      # Find or create the breed group
      breed_group = BreedGroup.find_or_create_by(name: breed_data["breed_group"])

      # Create the breed
      Breed.create(
        name: breed_data["name"],
        weight: breed_data.dig("weight", "imperial"),
        height: breed_data.dig("height", "imperial"),
        bred_for: breed_data["bred_for"],
        breed_group: breed_group,
        life_span: breed_data["life_span"],
        temperament: breed_data["temperament"],
        origin: breed_data["origin"],
        reference_image_id: breed_data["reference_image_id"]
      )
    end
  else
    puts "Failed to fetch breed data from the API."
  end
else
  puts "Please specify a valid SEED_TYPE (products or breeds)."
end
