defmodule Shop.Repo.Migrations.FixProductsColumns do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :price, :decimal
      add :description, :text
      add :image, :string
      add :category, :string
    end
  end
end
