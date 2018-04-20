defmodule EmoodjiWeb.PageControllerTest do
  use EmoodjiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 302) =~ "redirected"
  end
  
  test "GET /login", %{conn: conn} do
    conn = get conn, "/login"
    assert html_response(conn, 200) =~ "Log in"
  end
end
