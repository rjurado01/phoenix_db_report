defmodule AppWeb.SessionController do
  use AppWeb, :controller

  alias App.Session

  plug :put_layout, "empty.html"

  def new(conn, _params) do
    changeset = Session.changeset(%Session{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session" => params}) do
    changeset = Session.changeset(%Session{}, params)

    if changeset.valid? do
      conn
      |> put_session(:current_user_id, changeset.changes.user_id)
      |> put_flash(:info, "Signed in successfully.")
      |> redirect(to: Routes.home_path(conn, :index))
    else
      # needed by form_for to show errors
      {_, changeset} = Ecto.Changeset.apply_action(changeset, :insert)

      conn
      |> put_flash(:error, "There was a problem with your username/password")
      |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out succesfully.")
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
