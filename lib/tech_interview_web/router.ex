defmodule TechInterviewWeb.Router do
  use TechInterviewWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TechInterviewWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/register", UserController, only: [:create, :new]
    resources "/companies", CompanyController, only: [:show, :index]
    resources "/questions", QuestionController, except: [:delete]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TechInterviewWeb do
  #   pipe_through :api
  # end
end
