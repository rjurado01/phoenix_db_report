defmodule Web.SessionView do
  use Web, :view

  def email_error_class(f) do
    if f.errors[:email], do: 'error'
  end

  def password_error_class(f) do
    if f.errors[:password] && !f.errors[:email], do: 'error'
  end
end
