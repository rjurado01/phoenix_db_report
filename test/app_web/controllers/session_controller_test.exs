defmodule AppWeb.SessionControllerTest do
  use AppWeb.ConnCase

  test "GET /login", %{conn: conn} do
    conn = get(conn, "/login")
    assert html_response(conn, 200) =~ "Login to your account"
  end
end
