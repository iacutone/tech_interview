defmodule TechInterview.Repo do
  use Ecto.Repo,
    otp_app: :tech_interview,
    adapter: Ecto.Adapters.Postgres
end
