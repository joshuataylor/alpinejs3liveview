defmodule Alpinejs3liveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Alpinejs3liveviewWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Alpinejs3liveview.PubSub},
      # Start the Endpoint (http/https)
      Alpinejs3liveviewWeb.Endpoint
      # Start a worker by calling: Alpinejs3liveview.Worker.start_link(arg)
      # {Alpinejs3liveview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Alpinejs3liveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Alpinejs3liveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
