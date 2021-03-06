defmodule ApiBankingWeb.AccountController do
  use ApiBankingWeb, :controller

  def get_statement(conn, %{"account_id" => acc_id}) do
    with {:uuid, {:ok, _}} <- {:uuid, Ecto.UUID.cast(acc_id)},
         {:ok, statement} <- ApiBanking.get_statement(acc_id) do
      send_json(statement, conn, 200)
    else
      {:uuid, :error} ->
        send_json(
          %{type: "bad_request", description: "Account id must be a valid UUID"},
          conn,
          400
        )

      {:error, :account_not_exists} ->
        send_json(%{type: "not_found", description: "Account not found"}, conn, 404)
    end
  end

  def send_json(data, conn, status) do
    conn
    |> put_resp_header("content-type", "application/json")
    |> send_resp(status, Jason.encode!(data))
  end
end
