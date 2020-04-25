defmodule TechInterview.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :code, :string
      add :data_input, :string
      add :data_output, :string
      add :instructions, :string
      add :language, :string
      add :title, :string
      add :user_id, references("users")
      add :company_id, references("companies")

      timestamps()
    end

  end
end
