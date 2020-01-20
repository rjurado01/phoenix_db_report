defmodule App.User do
  use App.Model

  schema "users" do
    field :email, :string
    field :password_hash, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email])
    |> validate_required_password
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> downcase_email
    |> encrypt_password
  end

  # password is required only on create (password_hash is nil)
  defp validate_required_password(%Changeset{data: %{password_hash: password_hash}} = changeset)
      when is_nil(password_hash) do
    validate_required(changeset, [:password])
  end

  defp encrypt_password(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Bcrypt.hash_pwd_salt(password, log_rounds: 8))
  end

  defp downcase_email(%Changeset{valid?: true, changes: %{email: email}} = changeset)
       when not is_nil(email) do
    update_change(changeset, :email, &String.downcase/1)
  end

  defp validate_required_password(changeset), do: changeset
  defp encrypt_password(changeset), do: changeset
  defp downcase_email(changeset), do: changeset
end
