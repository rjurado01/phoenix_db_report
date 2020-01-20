defmodule AppWeb.Plugs.Auth do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts), do: opts

  def call(conn, _opts) do
    if user_id = Plug.Conn.get_session(conn, :current_user_id) do
      current_user = App.User.get(user_id)
      assign(conn, :current_user, current_user)
    else
      conn
        |> redirect(to: "/login")
        |> halt()
    end
  end
end
