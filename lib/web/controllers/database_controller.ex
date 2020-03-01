defmodule Web.DatabaseController do
  use Web, :controller

  alias App.Database

  plug :load_record, [model: Database] when action in ~w(update edit delete)a

  def index(conn, _params, _) do
    render(conn, "index.html", databases: Database.all)
  end

  def new(conn, _params, _) do
    changeset = Database.changeset(%{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params, _) do
    with {:ok, db} <- Database.create(params["database"]) do
      conn
      |> put_flash(:info, "Database created successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end

  def edit(conn, params, %{record: record}) do
    changeset = Database.changeset(record)
    render(conn, "edit.html", changeset: changeset)
  end

  def update(conn, params, %{record: record}) do
    with {:ok, db} <- Database.update(record, params["database"]) do
      conn
      |> put_flash(:info, "Database updated successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end

  def delete(conn, params, _) do
    with db <- Database.get!(params["id"]),
         {:ok, db} <- Database.delete(db) do
      conn
      |> put_flash(:info, "Database removed successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end
end
