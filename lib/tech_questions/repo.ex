defmodule TechQuestions.Repo do
  use Ecto.Repo,
    otp_app: :tech_questions,
    adapter: Ecto.Adapters.Postgres
end
