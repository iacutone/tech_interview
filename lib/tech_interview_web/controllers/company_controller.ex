defmodule TechInterviewWeb.CompanyController do
  use TechInterviewWeb, :controller

  alias TechInterview.Companies

  def index(conn, _params) do
    companies = Companies.list_company()
    render(conn, "index.html", companies: companies)
  end
end
