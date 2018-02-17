defmodule Pg2Demo.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Pg2Demo.Synchronization
    ]

    opts = [strategy: :one_for_one, name: Pg2Demo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
