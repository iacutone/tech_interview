defmodule TechInterview.Repo.Migrations.CreateQuestion do
  use Ecto.Migration

  def change do
    create table(:question) do
      add :data_input, :string
      add :data_output, :string
      add :instructions, :string
      add :language, :string
      add :title, :string
      add :user_id, :integer
      add :company_id, :integer

      timestamps()
    end

  end
end
