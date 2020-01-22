defmodule AppWeb.HomeControllerTest do
  use AppWeb.ConnCase

  describe "GET / when user is logged" do
    setup [:sign_in]

    test "shows Home title", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Home"
    end
  end

  describe "GET / when user is not logged" do
    test "shows Home title", %{conn: conn} do
      conn = get(conn, "/")
      assert redirected_to(conn) =~ "/login"
    end
  end
end
