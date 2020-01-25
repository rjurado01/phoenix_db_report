defmodule Web.FallbackController do
  use Web, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    case conn.private.phoenix_action do
      :new -> render(conn, "new.html", changeset: changeset)
      :update -> render(conn, "edit.html", changeset: changeset)
      _ -> conn |> put_view(Web.ErrorView) |> render(:"422")
    end
  end
end
