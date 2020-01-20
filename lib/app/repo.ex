defmodule App.Repo do
  use Ecto.Repo,
    otp_app: :app,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query, only: [order_by: 2, where: 3]

  def first(query) do
    query |> Ecto.Query.first |> one
  end

  def last(query) do
    query |> Ecto.Query.last |> one
  end

  def count(query) do
    query |> aggregate(:count, :id)
  end

  def order(query, params) do
    query |> order_by(^params)
  end
end
