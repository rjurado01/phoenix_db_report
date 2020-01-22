defmodule Web.SessionControllerTest do
  use Web.ConnCase

  test "GET /login", %{conn: conn} do
    conn = get(conn, "/login")
    assert html_response(conn, 200) =~ "Login to your account"
  end
end
