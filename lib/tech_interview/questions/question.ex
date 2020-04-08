defmodule TechInterview.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  alias TechInterview.Company

  schema "question" do
    field :code, :string
    field :language, :string
    field :title, :string
    field :user_id, :integer

    belongs_to :company, Company

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:code, :language, :title, :company_id, :user_id])
    |> validate_required([:code, :language, :title])
    |> cast_assoc(:company, required: true)
  end

  def programming_languages do
    [
      "",
      "Elixir",
      "Go",
      "Java",
      "JavaScript",
      "PHP",
      "Python",
      "Ruby",
      "Swift",
      "Rust"
    ]
  end
end
