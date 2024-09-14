defmodule UploadsPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :uploads_phoenix,
    adapter: Ecto.Adapters.Postgres
end
