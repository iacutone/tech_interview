defmodule TechInterviewWeb.SearchFormLive do
  use Phoenix.LiveView

  alias TechInterview.Company
  alias TechInterview.Questions
  alias TechInterview.Questions.Question

  def mount(params, session, socket) do
    assigns = [
      conn: socket,
      search_results: [],
      search_phrase: "",
      website: "",
      disabled: false,
      id: nil
    ]

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    TechInterviewWeb.LiveView.render("search_form.html", assigns)
  end

  def handle_event("search", %{"value" => search_phrase}, socket) do
    assigns = [
      search_results: TechInterview.Companies.search(search_phrase),
      search_phrase: search_phrase
    ]

    {:noreply, assign(socket, assigns)}
  end

  def handle_event("select", %{"id" => company_id}, socket) do
    company = TechInterview.Companies.get_company(company_id)
    assigns = [
      search_results: [],
      search_phrase: company.name,
      website: company.website,
      disabled: true,
      id: company.id
    ]

    {:noreply, assign(socket, assigns)}
  end

  def handle_event("enable", _, socket) do
    assigns = [
      search_results: [],
      search_phrase: "",
      website: "",
      disabled: false,
      id: nil
    ]

    {:noreply, assign(socket, assigns)}
  end
end
