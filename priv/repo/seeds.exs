alias Shop.Repo
alias Shop.Product

products = [
  %{
    name: "Laptop",
    description: "High-performance laptop with 16GB RAM and 512GB SSD",
    price: 999.99,
    image: "/images/laptop.jpg",
    category: "Electronics"
  },
  %{
    name: "Smartphone",
    description: "Latest smartphone with advanced camera and long battery life",
    price: 699.99,
    image: "/images/phone.jpg",
    category: "Electronics"
  },
  %{
    name: "Coffee Mug",
    description: "Ceramic coffee mug with unique design",
    price: 12.99,
    image: "/images/mug.jpg",
    category: "Home & Kitchen"
  },
  %{
    name: "Book: Learning Elixir",
    description: "Comprehensive guide to learning Elixir programming",
    price: 34.99,
    image: "/images/book.jpg",
    category: "Books"
  }
]

IO.puts "Starting to insert products..."

# Insert each product with error handling
Enum.each(products, fn product_attrs ->
  case Product.changeset(%Product{}, product_attrs) |> Repo.insert() do
    {:ok, product} ->
      IO.puts "✅ Inserted: #{product.name}"
    {:error, changeset} ->
      IO.puts "❌ Failed to insert: #{product_attrs[:name]}"
      IO.inspect changeset.errors
  end
end)

IO.puts "Finished inserting products!"
