require 'faker'

# Clear existing records
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
