defimpl Plug.Exception, for: Ecto.ConstraintError do
  def status(_exception), do: 422
end
