defmodule ExkillMongo.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @mongo_options [name: :mongo, database: "zkillboard", pool: DBConnection.Poolboy, hostname: "mongo"]

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: ExkillMongo.Worker.start_link(arg1, arg2, arg3)
      # worker(ExkillMongo.Worker, [arg1, arg2, arg3]),
      worker(Mongo, [@mongo_options])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExkillMongo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
