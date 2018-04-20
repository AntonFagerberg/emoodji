defmodule EmoodjiWeb.PostController do
  use EmoodjiWeb, :controller
  import Ecto.Query
  require Logger
  require IEx
  alias Emoodji.Repo
  alias Emoodji.Post
  alias Emoodji.User
  
  def index(conn, _params) do
    query = 
      from p in Post,
      join: u in User,
      where: p.user_id == u.id,
      order_by: [desc: p.id],
      select: %{user: u.name, message: p.message, timestamp: p.inserted_at}
    
    posts = Repo.all(query)
    render conn, "index.html", posts: posts
  end
  
  def create(conn, _params) do
    %{"message" => message} = conn.params
    user_id = get_session(conn, "user_id")
    changeset = Post.changeset(%Post{}, %{user_id: user_id, message: message})
    
    if changeset.valid? do
      Repo.insert!(changeset)
      
      conn
      |> put_flash("info", "Emoodji saved!")
      |> redirect(to: "/posts")
    else
      {:message, first_error} = Enum.at(changeset.errors, 0)
      error_msg = EmoodjiWeb.ErrorHelpers.translate_error(first_error)
      
      conn
      |> put_flash("error", error_msg)
      |> redirect(to: "/posts")
    end
  end
  
end