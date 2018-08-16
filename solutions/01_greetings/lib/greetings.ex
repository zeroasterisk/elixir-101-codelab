defmodule Greetings do
  @moduledoc """
  This is a Greeting library

  For this contrived example we have
  - hello() which just returns :world
  - hello(atom) which just returns atom
  - hello(string) which just returns "Hello {string}"
  """

  @doc """
  Super simple greeting to the world

  With no arguments, it returns :world
  With any atom, it returns that atom
  With any string, it returns "Hello {string}"
  Anything else raises an exception (ugly)

  ## Examples

      iex> Greetings.hello()
      :world

      iex> Greetings.hello(:world)
      :world

      iex> Greetings.hello(:people)
      :people

      iex> Greetings.hello("you")
      "Hello you"

      iex> Greetings.hello("Joe")
      "Hello Joe"
  """
  # Task: change :not_yet_world to :world
  def hello(), do: :world
  # Task: add a new function definition, with a guard clause to look for atoms
  def hello(myarg) when is_atom(myarg), do: myarg
  # Task: add a new function definition, with a guard clause to look for strings (bitstring)
  def hello(myarg) when is_bitstring(myarg), do: "Hello #{myarg}"
  def hello(_), do: raise "Unsupported Argument to hello()"

end
