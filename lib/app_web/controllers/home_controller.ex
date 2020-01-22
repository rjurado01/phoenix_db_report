defmodule AppWeb.HomeController do
  use AppWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:message, "Welcome Back!")
    |> render("index.html")
  end
end
