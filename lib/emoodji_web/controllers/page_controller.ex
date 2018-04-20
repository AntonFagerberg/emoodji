defmodule EmoodjiWeb.PageController do
  use EmoodjiWeb, :controller
  import Ecto.Query
  import Plug.Conn
  require Logger
  alias Emoodji.Repo
  alias Emoodji.User

  def index(conn, _params) do
    if get_session(conn, "user_id") == nil do
      redirect conn, to: "/login"
    else
      redirect conn, to: "/posts"
    end
  end

  def login(conn, _params) do
    render conn, "index.html"
  end
  
  def authenticate(conn, _params) do 
    %{"username" => username} = conn.params
    
    user_id = 
      Repo.one(
        from u in User,
        select: u.id,
        where: u.name == ^username
      )
      
    if (user_id == nil) do
      conn
      |> put_flash("error", "User '#{username}' did not exist!")
      |> redirect(to: "/login")
    else
      conn
      |> put_session("user_id", user_id)
      |> redirect(to: "/posts")
    end
  end
  
  def sign_out(conn, _params) do
    conn
    |> delete_session("user_id")
    |> redirect(to: "/login")
  end
end
