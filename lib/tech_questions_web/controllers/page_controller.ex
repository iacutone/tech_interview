defmodule TechQuestionsWeb.PageController do
  use TechQuestionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
