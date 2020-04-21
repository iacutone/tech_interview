defmodule TechInterviewWeb.Plugs.AuthorizeUser do
  import Plug.Conn
  import Phoenix.Controller

  alias TechInterviewWeb.Router.Helpers

  def init(opts), do: opts

  def call(conn, opts) do
    if TechInterview.Accounts.Auth.signed_in?(conn) do
      conn
    else
      conn
      |> put_flash(:error, "You are not allowed to access this page.")
      |> redirect(to: Helpers.question_path(conn, :index))
      |> halt()
    end
  end
end
