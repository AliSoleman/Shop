defmodule ShopWeb.PageController do
  use ShopWeb, :controller
  alias Shop.Products
  def home(conn, _params) do
    products = Products.list_products()
    conn
    |> assign(:products, products)
    |> render(:home)
  end
end
