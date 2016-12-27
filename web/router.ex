defmodule OssSwipe.Router do
  use OssSwipe.Web, :router
  use ExAdmin.Router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", OssSwipe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/swipe", SwipeController, :index
  end

  scope "/admin", ExAdmin do
    pipe_through :protected
    admin_routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", OssSwipe do
  #   pipe_through :api
  # end
end
