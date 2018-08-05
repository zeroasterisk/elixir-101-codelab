defmodule GreetingPlugTest do
  use ExUnit.Case
  doctest GreetingPlug

  test "greets the world" do
    assert GreetingPlug.hello() == :world
  end
end

