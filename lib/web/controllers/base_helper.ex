defmodule Web.Controller.BaseHelper do
  def load_record(conn, model: model) do
    id = conn.params["id"]

    case model.get(id) do
      nil -> Web.FallbackController.call(conn, {:error, :not_found}) |> Plug.Conn.halt
      record -> Plug.Conn.assign(conn, :record, record)
    end
  end
end
