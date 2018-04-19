defmodule EmoodjiWeb.PostController do
  use EmoodjiWeb, :controller
  import Ecto.Query
  require Logger
  alias Emoodji.Repo
  alias Emoodji.Post
  alias Emoodji.User
  
  def index(conn, _params) do
    query = 
      from p in Post,
      join: u in User,
      where: p.user_id == u.id,
      order_by: [desc: p.id],
      select: %{user: u.name, message: p.message}
    
    posts = Repo.all(query)
    
    render conn, "index.html", posts: posts, csrf_token: get_csrf_token()
  end
  
  def create(conn, _params) do
    %{"message" => message} = conn.params
    Repo.insert(%Post{user_id: 1, message: message})
    redirect conn, to: "/posts"
  end
  
end