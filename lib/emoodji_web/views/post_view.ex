defmodule EmoodjiWeb.PostView do
  use EmoodjiWeb, :view
  import Phoenix.Controller, only: [get_csrf_token: 0]
  
  def format_timestamp(timestamp) do
    "#{timestamp.hour}:#{timestamp.minute} #{timestamp.month}/#{timestamp.day}-#{timestamp.year}"
  end
end