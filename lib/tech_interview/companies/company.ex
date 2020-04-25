defmodule TechInterview.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :website, :string
    field :health_care, :boolean
    field :dependent_coverage, :boolean
    field :retirement_plan, :boolean
    field :retirement_plan_match, :integer
    field :professional_dev, :boolean
    field :professional_dev_budget, :integer
    field :parental_leave, :boolean
    field :parental_leave_length, :integer

    has_many :questions, TechInterview.Questions.Question

    timestamps()
  end

  def changeset(company, attrs) do
    company
    |> cast(attrs, [
      :name, 
      :website, 
      :health_care, 
      :dependent_coverage, 
      :retirement_plan, 
      :retirement_plan_match, 
      :professional_dev, 
      :professional_dev_budget, 
      :parental_leave, 
      :parental_leave_length
    ])
    |> validate_required([:name, :website])
  end
end
