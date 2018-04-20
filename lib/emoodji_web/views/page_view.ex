defmodule EmoodjiWeb.PageView do
  use EmoodjiWeb, :view
  import Phoenix.Controller, only: [get_csrf_token: 0]
end
