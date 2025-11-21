defmodule ShopWeb.PageController do
  use ShopWeb, :controller
  alias Shop.{Repo,Product}
  # @products [
  #   %{
  #     id: 1,
  #     name: "Laptop",
  #     description: "High-performance laptop with 16GB RAM and 512GB SSD",
  #     price: 999.99,
  #     image: "/images/laptop.jpg",
  #     category: "Electronics"
  #   },
  #   %{
  #     id: 2,
  #     name: "Smartphone",
  #     description: "Latest smartphone with advanced camera and long battery life",
  #     price: 699.99,
  #     image: "/images/phone.jpg",
  #     category: "Electronics"
  #   },
  #   %{
  #     id: 3,
  #     name: "Coffee Mug",
  #     description: "Ceramic coffee mug with unique design",
  #     price: 12.99,
  #     image: "/images/mug.jpg",
  #     category: "Home & Kitchen"
  #   },
  #   %{
  #     id: 4,
  #     name: "Book: Learning Elixir",
  #     description: "Comprehensive guide to learning Elixir programming",
  #     price: 34.99,
  #     image: "/images/book.jpg",
  #     category: "Books"
  #   }
  # ]
  def home(conn, _params) do
    products = Repo.all(Product)
    conn
    |> assign(:products, products)
    |> render(:home)
  end
end
