defmodule TechInterview.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :website, :string

    has_many :questions, TechInterview.Questions.Question

    timestamps()
  end

  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :website])
    |> validate_required([:name, :website])
  end
end
