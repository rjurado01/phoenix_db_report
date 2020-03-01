defmodule App.Model do
  defmacro __using__(_params) do
    quote do
      use Ecto.Schema
      # use Arc.Ecto.Schema

      import Ecto.Changeset
      import Ecto.Query, only: [dynamic: 2]

      alias App.Repo
      alias Ecto.Changeset

      # TODO replace by is_struct when elixir v1.11.0 is published
      # https://hexdocs.pm/elixir/master/Kernel.html#is_struct/1
      def changeset(record) when is_map(record) and :erlang.is_map_key(:__struct__, record) do
        changeset(record, %{})
      end

      def changeset(attrs) when is_map(attrs) do
        changeset(struct(__MODULE__), attrs)
      end

      def all do
        __MODULE__ |> Repo.all
      end

      def first do
        __MODULE__ |> Repo.first
      end

      def last do
        __MODULE__ |> Repo.last
      end

      def get_by(params) do
        __MODULE__ |> Repo.get_by(params)
      end

      def count do
        __MODULE__ |> Repo.count
      end

      def get(id) do
        try do
          __MODULE__ |> Repo.get(id)
        rescue
          Ecto.Query.CastError -> nil
        end
      end

      def get!(id) do
        __MODULE__ |> Repo.get!(id)
      end

      def create(attrs \\ %{}) do
        struct(__MODULE__)
        |> __MODULE__.changeset(attrs)
        |> Repo.insert
      end

      def update(object, attrs) do
        object
        |> __MODULE__.changeset(attrs)
        |> Repo.update
      end

      defdelegate delete(object), to: Repo
    end
  end
end
