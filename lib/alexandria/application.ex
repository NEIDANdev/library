defmodule Alexandria.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AlexandriaWeb.Telemetry,
      Alexandria.Repo,
      {DNSCluster, query: Application.get_env(:alexandria, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Alexandria.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Alexandria.Finch},
      # Start a worker by calling: Alexandria.Worker.start_link(arg)
      # {Alexandria.Worker, arg},
      # Start to serve requests, typically the last entry
      AlexandriaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Alexandria.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AlexandriaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
