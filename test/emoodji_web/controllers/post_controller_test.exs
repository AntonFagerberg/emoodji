defmodule EmoodjiWeb.PostontrollerTest do
  use EmoodjiWeb.ConnCase

  @default_opts [
    store: :cookie,
    key: "foobar",
    encryption_salt: "encrypted cookie salt",
    signing_salt: "signing salt",
    log: false
  ]

  @signing_opts Plug.Session.init(Keyword.put(@default_opts, :encrypt, false))

  test "GET /post unathorized", %{conn: conn} do
    conn = get conn, "/posts"

    assert html_response(conn, 302) =~ "redirect"
  end

  test "GET /post", %{conn: conn} do
    conn =
      put_in(conn.secret_key_base, "secret")
      |> Plug.Session.call(@signing_opts)
      |> fetch_session
      |> put_session("user_id", 1)
      |> get("/posts")

    assert html_response(conn, 200) =~ "Post"
  end
end
