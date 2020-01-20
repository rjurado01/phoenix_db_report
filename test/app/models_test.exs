defmodule App.ModelsTest do
  use App.DataCase

  alias App.Models

  describe "queries" do
    alias App.Models.Query

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def query_fixture(attrs \\ %{}) do
      {:ok, query} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Models.create_query()

      query
    end

    test "list_queries/0 returns all queries" do
      query = query_fixture()
      assert Models.list_queries() == [query]
    end

    test "get_query!/1 returns the query with given id" do
      query = query_fixture()
      assert Models.get_query!(query.id) == query
    end

    test "create_query/1 with valid data creates a query" do
      assert {:ok, %Query{} = query} = Models.create_query(@valid_attrs)
    end

    test "create_query/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Models.create_query(@invalid_attrs)
    end

    test "update_query/2 with valid data updates the query" do
      query = query_fixture()
      assert {:ok, %Query{} = query} = Models.update_query(query, @update_attrs)
    end

    test "update_query/2 with invalid data returns error changeset" do
      query = query_fixture()
      assert {:error, %Ecto.Changeset{}} = Models.update_query(query, @invalid_attrs)
      assert query == Models.get_query!(query.id)
    end

    test "delete_query/1 deletes the query" do
      query = query_fixture()
      assert {:ok, %Query{}} = Models.delete_query(query)
      assert_raise Ecto.NoResultsError, fn -> Models.get_query!(query.id) end
    end

    test "change_query/1 returns a query changeset" do
      query = query_fixture()
      assert %Ecto.Changeset{} = Models.change_query(query)
    end
  end
end
