defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name , :description , :image , :category , :slug , :id]}
  schema "products" do
    field :name, :string
    field :slug, :string
    field :price, :decimal
    field :description, :string
    field :image, :string
    field :category, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price, :description, :image, :category])
    |> validate_required([:name])
    |> format_name()
    |> generate_slug()
    |> validate_length(:name, min: 3, max: 30)
    |> validate_length(:description, min: 3, max: 300)
    |> unique_constraint(:slug)
  end

  defp format_name(changeset) do
    name =
     changeset.changes.name
     |> String.trim()
    put_change(changeset, :name, name)
  end
  defp generate_slug(changeset) do
     name =
     changeset.changes.name
     |> String.downcase()
     |> String.replace(" ", "-")
    put_change(changeset, :slug, name)
  end
end
