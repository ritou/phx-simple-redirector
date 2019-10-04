defmodule SimpleRedirectorWeb.Router do
  use SimpleRedirectorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SimpleRedirectorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    post "/", PageController, :send

    post "/post", PageController, :post
  end

  # Other scopes may use custom stacks.
  # scope "/api", SimpleRedirectorWeb do
  #   pipe_through :api
  # end
end
