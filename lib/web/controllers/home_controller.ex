defmodule Web.HomeController do
  use Web, :controller

  def index(conn, _params, _) do
    conn
    |> assign(:message, "Welcome Back!")
    |> render("index.html")
  end
end
