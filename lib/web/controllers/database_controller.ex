defmodule Web.DatabaseController do
  use Web, :controller

  alias App.Database

  @hide_password "**sectret**"

  def index(conn, _params) do
    render(conn, "index.html", databases: Database.all)
  end

  def new(conn, _params) do
    changeset = Database.changeset(%Database{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    with {:ok, db} <- Database.create(params["database"]) do
      conn
      |> put_flash(:info, "Database created successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end

  def edit(conn, params) do
    db = Database.get!(params["id"])
    changeset = Database.changeset(db, %{password: @hide_password})
    render(conn, "edit.html", changeset: changeset)
  end

  def update(conn, params) do
    with db <- Database.get!(params["id"]),
         {:ok, db} <- Database.update(db, params["database"]) do
      conn
      |> put_flash(:info, "Database updated successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end

  def delete(conn, params) do
    with db <- Database.get!(params["id"]),
         {:ok, db} <- Database.delete(db) do
      conn
      |> put_flash(:info, "Database removed successfully")
      |> redirect(to: Routes.database_path(conn, :index))
    end
  end
end
