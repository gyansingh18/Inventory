Cateogory.destroy_all
puts "Creating catrogories"
electronics = Cateogory.create!(name: "Electronics")
puts "cateogories created"
Product.create(name: "Lg Led 32", price: 12500, cateogory: electronics)
puts "Product created"
