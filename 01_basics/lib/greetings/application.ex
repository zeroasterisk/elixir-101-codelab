defmodule Greetings.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    greeting = System.get_env("GREETING") || "Hello"

    children = [
      {Greetings, [%{greeting: greeting}, [port: 8080]]},
    ]

    opts = [strategy: :one_for_one, name: Greetings.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
