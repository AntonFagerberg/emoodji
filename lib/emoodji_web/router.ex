defmodule EmoodjiWeb.Router do
  use EmoodjiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plug.Parsers, parsers: [:urlencoded]
  end
  
  pipeline :secure do
    plug :browser
    plug Emoodji.Plugs.ValidateSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  scope "/", EmoodjiWeb do
    pipe_through :browser
    
    get "/", PageController, :index
    get "/login", PageController, :login
    post "/login", PageController, :authenticate
    get "/sign-out", PageController, :sign_out
  end

  scope "/posts", EmoodjiWeb do
    pipe_through :secure # Use the default browser stack
    
    get "/", PostController, :index
    post "/", PostController, :create
  end
  
  

  # Other scopes may use custom stacks.
  # scope "/api", EmoodjiWeb do
  #   pipe_through :api
  # end
end
