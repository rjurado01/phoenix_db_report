defmodule App.EncryptedType do
  alias App.EncryptionAES  # alias our EncryptionAES encrypt & decrypt functions (3.1 & 3.2)

  use Ecto.Type  # Check this module conforms to Ecto.type behavior.

  def type, do: :binary # :binary is the data type ecto uses internally

  # cast/1 simply calls to_string on the value and returns a "success" tuple
  def cast(value) do
    {:ok, to_string(value)}
  end

  # dump/1 is called when the field value is about to be written to the database
  def dump(value) do
    ciphertext = value |> to_string |> EncryptionAES.encrypt
    {:ok, ciphertext} # ciphertext is :binary type (no conversion required)
  end

  # load/1 is called when the field is loaded from the database
  def load(value) do
    {:ok, EncryptionAES.decrypt(value)}
  end
end
