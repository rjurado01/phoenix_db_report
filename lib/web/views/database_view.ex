defmodule Web.DatabaseView do
  use Web, :view

  def error_class(f, field) do
    if f.errors[field], do: 'state-invalid'
  end
end
