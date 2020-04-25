defmodule TechInterview.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :website, :string
      add :health_care, :boolean
      add :dependent_coverage, :boolean
      add :retirement_plan, :boolean
      add :retirement_plan_match, :integer
      add :professional_dev, :boolean
      add :professional_dev_budget, :integer
      add :parental_leave, :boolean
      add :parental_leave_length, :integer

      timestamps()
    end

  end
end
