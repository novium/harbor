defmodule HarborWeb.Router do
  use HarborWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HarborWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", HarborWeb.API do
    pipe_through :api
  end

  forward "/graphql", Absinthe.Plug,
    json_codec: Jason,
    schema: HarborWeb.Schema
  
  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      json_codec: Jason,
      schema: HarborWeb.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", HarborWeb do
  #   pipe_through :api
  # end
end
