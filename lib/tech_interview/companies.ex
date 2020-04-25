defmodule TechInterview.Companies do
  @moduledoc """
  The Questions context.
  """

  import Ecto.Query, warn: false
  alias TechInterview.Repo

  alias TechInterview.Company

  def search(""), do: []
  def search(criteria) do
    from(c in Company,
      where: like(c.name, ^"%#{criteria}%"),
      select: %{id: c.id, name: c.name, website: c.website}
    ) |> Repo.all
  end

  def get_company(id), do: Repo.get!(Company, id)

  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  def list_company do
    Repo.all(Company)
  end
end
