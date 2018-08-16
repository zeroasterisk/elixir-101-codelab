defmodule GreetingsTest do
  use ExUnit.Case
  # take a look at this... it runs iex> lines in docblocks as tests!
  doctest Greetings

  describe "hello" do
    test "says hello to the world" do
      assert Greetings.hello() == :world
    end
    test "says :an_atom back to you" do
      assert Greetings.hello(:an_atom) == :an_atom
    end
    # look for more tests in the docblock of the Greetings library
  end

end

