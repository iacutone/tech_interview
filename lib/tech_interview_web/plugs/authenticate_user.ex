defmodule TechInterviewWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller

  alias TechInterviewWeb.Router.Helpers

  def init(opts), do: opts

  def call(conn, _opts) do
    if TechInterview.Accounts.Auth.signed_in?(conn) do
      conn
    else
      conn
      |> put_flash(:error, "Please sign in or sign up.")
      |> redirect(to: Helpers.session_path(conn, :new))
      |> halt()
    end
  end
end
