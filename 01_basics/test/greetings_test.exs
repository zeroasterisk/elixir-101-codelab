defmodule GreetingsTest do
  use ExUnit.Case
  doctest Greetings

  test "greets the world" do
    assert Greetings.hello() == :world
  end
end

