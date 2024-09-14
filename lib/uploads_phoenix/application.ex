defmodule UploadsPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UploadsPhoenixWeb.Telemetry,
      UploadsPhoenix.Repo,
      {DNSCluster, query: Application.get_env(:uploads_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UploadsPhoenix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: UploadsPhoenix.Finch},
      # Start a worker by calling: UploadsPhoenix.Worker.start_link(arg)
      # {UploadsPhoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      UploadsPhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UploadsPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UploadsPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
