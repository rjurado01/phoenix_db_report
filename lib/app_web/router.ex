defmodule AppWeb.Router do
  use AppWeb, :router

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

  scope "/", AppWeb do
    pipe_through [:browser, AppWeb.Plugs.Guest]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", AppWeb do
    pipe_through [:browser, AppWeb.Plugs.Auth]

    get "/", HomeController, :index
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppWeb do
  #   pipe_through :api
  # end
end
