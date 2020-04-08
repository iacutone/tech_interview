defmodule TechQuestions.Accounts.Auth do
  alias TechQuestions.Accounts

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!Accounts.get_user!(user_id)
  end

  def current_user(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    Accounts.get_user!(user_id)
  end
end
