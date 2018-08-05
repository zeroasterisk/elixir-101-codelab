defmodule GreetingPlug do
  @moduledoc """
  This will take our Greeting module and implement in a "plug" pattern.

  A plug is a convention which recieves a connection object
  and returns a connection object, intended to be chained
  togther with other plugs to form a composable "pipeline" of plugs.

  The Plug.Conn module gives us the main functions
  we will use to work with our connection, which is
  a %Plug.Conn{} struct, also defined in this module.
  """

  import Plug.Conn

  @doc """
  This will initialize the Plug at when we start a Cowboy webserver.
  We will pass in options, which we can use later.
  """
  def init(opts) do
    Map.put(opts, :my_greeting, "Hello")
  end

  @doc """
  Every time we use this plug, we execute call
  with the connection (request and response) and options.

  Because we can use pattern matching on function executions,
  this makes a very convenient and very performant router.
  """
  def call(conn, opts) do
    # And we send a response back, with a status code and a body
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{opts[:my_greeting]} world")
  end
end
