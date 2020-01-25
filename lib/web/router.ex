defmodule Web.Router do
  use Web, :router

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

  pipeline :admin_layout do
    plug :put_layout, {Web.LayoutView, :admin}
  end

  scope "/", Web do
    pipe_through [:browser, Web.Plugs.Guest]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  scope "/", Web do
    pipe_through [:browser, Web.Plugs.Auth]

    get "/", HomeController, :index

    delete "/logout", SessionController, :delete
  end

  scope "/admin", Web do
    pipe_through [:browser, :admin_layout, Web.Plugs.Auth]

    resources "/databases", DatabaseController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
