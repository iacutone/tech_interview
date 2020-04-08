defmodule TechQuestionsWeb.Router do
  use TechQuestionsWeb, :router

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

  scope "/", TechQuestionsWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/register", UserController, only: [:create, :new]
    resources "questions", QuestionController, except: [:delete]

    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TechQuestionsWeb do
  #   pipe_through :api
  # end
end
