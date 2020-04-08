defmodule TechInterviewWeb.PageController do
  use TechInterviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
