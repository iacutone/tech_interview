defmodule TechQuestions.Accounts.Auth do
  def signed_in?(conn) do
    # conn.assigns[:current_user]
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!User.Repo.get(User.Accounts.User, user_id)
  end
end
