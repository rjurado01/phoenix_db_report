defmodule App.DatabaseTest do
  use App.DataCase

  alias App.Database

  test "creates ok" do
    assert {:ok, %Database{} = db} = Database.create(%{
      type: "postgres",
      title: "DB Example",
      name: "db_example",
      host: "127.0.0.1",
      port: 5432,
      user: "user",
      password: "12345678"
    })
  end

  test "changeset/2 applies correct validations" do
    changeset = Database.changeset(%Database{}, %{})

    assert match_array(changeset.required, ~w[type title name host port user password]a)
  end
end
