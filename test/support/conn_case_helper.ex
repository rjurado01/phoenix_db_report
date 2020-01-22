defmodule Web.ConnCaseHelper do
  def sign_in(%{conn: conn}) do
    user = App.Factory.insert(:user)

    conn = conn
    |> Plug.Conn.assign(:current_user, user)
    |> Plug.Test.init_test_session(current_user_id: user.id)

    {:ok, conn: conn}
  end
end
