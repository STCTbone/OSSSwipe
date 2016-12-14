defmodule OssSwipe.Router do
  use OssSwipe.Web, :router
  use ExAdmin.Router

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

  scope "/", OssSwipe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", OssSwipe do
  #   pipe_through :api
  # end
end
