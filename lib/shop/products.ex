
defmodule Shop.Products do
     alias Shop.Repo
     alias Shop.Products.Product
   #   import Ecto.Query

     def list_products(), do: Repo.all(Product)
     def get_product(id), do: Repo.get(Product, id)
     def delete_product(product = %Product{}) do
        Repo.delete(product)
     end

    #  To run it in terminal:
    #   Products.create_product(%{
    #     name: "Sample Product",
    #     price: Decimal.new("19.99"),
    #     description: "This is a sample product.",
    #     image: "sample.jpg",
    #     category: "Books"
    #   })

     def create_product(attrs \\ %{}) do
        %Product{}
        |> Product.changeset(attrs)
        |> Repo.insert()
     end
end
