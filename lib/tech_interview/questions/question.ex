defmodule TechInterview.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechInterview.Company

  schema "question" do
    field :data_input, :string
    field :data_output, :string
    field :code, :string
    field :instructions, :string
    field :language, :string
    field :title, :string
    field :user_id, :integer

    belongs_to :company, Company

    timestamps()
  end

  def changeset(question, attrs, _id) do
    question
    |> cast(attrs, [:data_input, :data_output, :code, :instructions, :language, :title, :company_id, :user_id])
    |> validate_required([:data_input, :data_output, :code, :instructions, :language, :title])
  end

  def changeset(question, attrs) do
    question
    |> cast(attrs, [:data_input, :data_output, :code, :instructions, :language, :title, :company_id, :user_id])
    |> validate_required([:data_input, :data_output, :code, :instructions, :language, :title])
    |> cast_assoc(:company, required: true)
  end

  def programming_languages do
    [
      [key: "", value: ""],
      [key: "Elixir", value: "elixir"],
      [key: "Go", value: "go"],
      [key: "Java", value: "java"],
      [key: "JavaScript", value: "js"],
      [key: "PHP", value: "php"],
      [key: "Python", value: "python"],
      [key: "Ruby", value: "ruby"],
      [key: "Swift", value: "swift"],
    ]
  end
end
