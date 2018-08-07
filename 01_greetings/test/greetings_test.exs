defmodule GreetingsTest do
  use ExUnit.Case
  # take a look at this... it runs iex> lines in docblocks as tests!
  doctest Greetings

  describe "hello" do
    test "says hello to the world" do
      assert Greetings.hello() == :world
    end
  end

  # for simplicity sake we will test our "sub-functions" first

  describe "clean_name" do
    # clean_name takes a name and cleans it up (makes sense)
    test "clean_name will remove leading and trailing whitespace" do
      assert Greetings.clean_name(" joe ") == "Joe"
    end
    test "clean_name will normalize funky characters" do
      # https://hexdocs.pm/elixir/String.html#normalize/2
      string1 = "Leña"
      string2 = "Leña"
      assert string2 != string1
      assert string1 |> Greetings.clean_name() == string2
    end
    test "clean_name will upper case the first letter" do
      assert Greetings.clean_name("joe") == "Joe"
    end
    test "clean_name will upper case the first letter of each word" do
      assert Greetings.clean_name("joe bob") == "Joe Bob"
    end
    test "clean_name will upper case only the first letter of each word" do
      assert Greetings.clean_name("JOe boB") == "Joe Bob"
    end
  end

  describe "greet" do
    # the greet function is our main "front door"
    #   but it can rely on other functions
    test "greets a Sally by name" do
      assert Greetings.greet("Sally") == "Hello Sally!"
    end
    test "greets a Susan by name" do
      assert Greetings.greet("Susan") == "Hello Susan!"
    end
    test "greets a Sarah by name, even though an atom was passed in" do
      assert Greetings.greet(:Sarah) == "Hello Sarah!"
    end
    test "greets a Number by name, even though an integer was passed in" do
      assert Greetings.greet(7) == "Hello Number 7!"
    end
    test "greets a list of names as CSV" do
      names = ["Jim", "Joe", "Bob"]
      assert Greetings.greet(names) == "Hello Jim, Joe, Bob!"
    end
    test "greets without args as Hello Nobody!" do
      assert Greetings.greet() == "Hello Nobody!"
    end
  end

end

