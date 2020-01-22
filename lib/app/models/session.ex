defmodule App.Session do
  use Ecto.Schema

  import Ecto.Changeset

  alias App.User
  alias Ecto.Changeset

  schema "sessions" do
    field :email, :string, virtual: true
    field :password, :string, virtual: true
    field :hash, :string, virtual: true
    field :user_id, :string, virtual: true
  end

  def changeset(session, attrs) do
    session
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> find_user
    |> authenticate
  end

  defp find_user(%Changeset{valid?: true, changes: %{email: email}} = changeset) do
    user = User.get_by(email: String.downcase(email))

    if user do
      Changeset.change(changeset, user_id: user.id, hash: user.password_hash)
    else
      Changeset.add_error(changeset, :email, "invalid", [validation: :invalid])
    end
  end

  defp find_user(changeset), do: changeset

  defp authenticate(
    %Changeset{valid?: true, changes: %{password: password, hash: hash}} = changeset
  ) do
    if Bcrypt.verify_pass(password, hash) do
      changeset
    else
      Changeset.add_error(changeset, :password, "invalid", [validation: :invalid])
    end
  end

  defp authenticate(changeset), do: changeset
end
