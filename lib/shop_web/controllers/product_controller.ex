defmodule ShopWeb.ProductController do
  use ShopWeb, :controller
  alias Shop.Products
  def index(conn, _params) do
    products = Products.list_products()
    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"id" => id}) do
    product = Products.get_product(id)
    conn
    |> assign(:product, product)
    |> render(:show)
  end

end
