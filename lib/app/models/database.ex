defmodule App.Database do
  use App.Model

  @types ~w[postgres]

  @required_fields ~w[type title name host port user password]a
  @optional_fields ~w[]a

  schema "databases" do
    field :type, :string
    field :title, :string
    field :name, :string
    field :host, :string
    field :port, :integer
    field :user, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
