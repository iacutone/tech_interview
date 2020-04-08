defmodule TechInterview.QuestionsTest do
  use TechInterview.DataCase

  alias TechInterview.Questions

  describe "question" do
    alias TechInterview.Questions.Question

    @valid_attrs %{code: "some code", company_id: 42, language: "some language", user_id: 42}
    @update_attrs %{code: "some updated code", company_id: 43, language: "some updated language", user_id: 43}
    @invalid_attrs %{code: nil, company_id: nil, language: nil, user_id: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Questions.create_question()

      question
    end

    test "list_question/0 returns all question" do
      question = question_fixture()
      assert Questions.list_question() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Questions.create_question(@valid_attrs)
      assert question.code == "some code"
      assert question.company_id == 42
      assert question.language == "some language"
      assert question.user_id == 42
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Questions.update_question(question, @update_attrs)
      assert question.code == "some updated code"
      assert question.company_id == 43
      assert question.language == "some updated language"
      assert question.user_id == 43
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end
end
