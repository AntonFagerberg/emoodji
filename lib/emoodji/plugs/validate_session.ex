defmodule Emoodji.Plugs.ValidateSession do
  import Plug.Conn
  require IEx

  def init(default), do: default

  def call(conn, _default) do
    user_id = get_session(conn, "user_id")
    
    if (user_id != nil) do
      conn
    else
      conn
      |> Phoenix.Controller.redirect(to: "/login")
      |> halt
    end
  end
end