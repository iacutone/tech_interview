defmodule TechInterviewWeb.QuestionController do
  use TechInterviewWeb, :controller

  plug TechInterviewWeb.Plugs.AuthenticateUser when action in [
    :new,
    :create, 
    :edit, 
    :update
  ]

  plug TechInterviewWeb.Plugs.AuthorizeUser when action in [
    :edit, 
    :update
  ]

  alias TechInterview.Repo
  alias TechInterview.Questions
  alias TechInterview.Questions.Question

  alias TechInterview.Company

  def index(conn, _params) do
    questions = Questions.list_question() |> Repo.preload(:company)
    render(conn, "index.html", questions: questions)
  end

  def new(conn, _params) do
    changeset = Questions.change_question(%Question{company: %Company{}})
    render(conn, 
      "new.html", 
      changeset: changeset, 
      languages: Question.programming_languages()
    )
  end

  def create(conn, %{"company_id" => id, "question" => question_params}) do
    params_with_user = Map.put(question_params, "user_id", Plug.Conn.get_session(conn, :current_user_id))
    case Questions.create_question(params_with_user, id) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, 
          "new.html", 
          changeset: changeset, 
          languages: Question.programming_languages()
        )
    end
  end

  def create(conn, %{"question" => question_params}) do
    params_with_user = Map.put(question_params, "user_id", Plug.Conn.get_session(conn, :current_user_id))
    case Questions.create_question(params_with_user) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, 
          "new.html", 
          changeset: changeset, 
          languages: Question.programming_languages()
        )
    end
  end

  def show(conn, %{"id" => id}) do
    question = Questions.get_question!(id) |> Repo.preload(:company)
    render(conn, "show.html", question: question)
  end

  def edit(conn, %{"id" => id}) do
    question = Questions.get_question!(id) |> Repo.preload(:company)
    changeset = Questions.change_question(question)
    render(conn, 
      "edit.html", 
      question: question, 
      changeset: changeset,
      languages: Question.programming_languages()
    )
  end

  def update(conn, %{"id" => id, "company_id" => company_id, "question" => question_params}) do
    question = Questions.get_question!(id) |> Repo.preload(:company)

    params_with_user = Map.put(question_params, "user_id", Plug.Conn.get_session(conn, :current_user_id))
    case Questions.create_question(params_with_user, id) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question created successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, 
          "new.html", 
          changeset: changeset, 
          languages: Question.programming_languages()
        )
    end
  end

  def update(conn, %{"id" => id, "question" => question_params}) do
    question = Questions.get_question!(id) |> Repo.preload(:company)

    case Questions.update_question(question, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question updated successfully.")
        |> redirect(to: Routes.question_path(conn, :show, question))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, 
          "edit.html", 
          question: question, 
          changeset: changeset,
          languages: Question.programming_languages()
        )
    end
  end
end
