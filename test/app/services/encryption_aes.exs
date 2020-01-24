defmodule App.EncryptionAESTest do
  use ExUnit.Case
  alias App.EncryptionAES

  test ".encrypt includes the random IV in the value" do
    <<iv::binary-16, ciphertext::binary>> = EncryptionAES.encrypt("hello")

    assert String.length(iv) != 0
    assert String.length(ciphertext) != 0
    assert is_binary(ciphertext)
  end

  test ".encrypt does not produce the same ciphertext twice" do
    assert EncryptionAES.encrypt("hello") != EncryptionAES.encrypt("hello")
  end

  test "decrypt/1 ciphertext that was encrypted with default key" do
    plaintext = "hello" |> EncryptionAES.encrypt |> EncryptionAES.decrypt()
    assert plaintext == "hello"
  end
end
