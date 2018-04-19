defmodule EmoodjiWeb.PostView do
  use EmoodjiWeb, :view
  
  def format_timestamp(timestamp) do
    "#{timestamp.hour}:#{timestamp.minute} #{timestamp.month}/#{timestamp.day}-#{timestamp.year}"
  end
end