defmodule Ex10101BasicsTest do
  use ExUnit.Case
  doctest Ex10101Basics

  test "greets the world" do
    assert Ex10101Basics.hello() == :world
  end
end
