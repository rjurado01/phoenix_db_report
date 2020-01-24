defmodule App.Repo.Migrations.CreateDatabase do
  use Ecto.Migration

  def change do
    create table(:databases) do
      add :type, :string
      add :title, :string
      add :name, :string
      add :host, :string
      add :port, :integer
      add :user, :string
      add :password, :binary

      timestamps()
    end

    create unique_index(:databases, [:title])
  end
end
