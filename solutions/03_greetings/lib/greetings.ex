defmodule Greetings do
  @moduledoc """
  This is a Greeting library

  For this contrived example we have
  - hello() which just returns :world
  - hello(atom) which just returns atom
  - hello(string) which just returns "Hello {string}"
  - greet(name) which returns a "Hello $name!" (english is default language)
  - greet(name, lang = [:EN]) which returns a language specific "Hello $name!"
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
  def hello(), do: :world
  def hello(myarg) when is_atom(myarg), do: myarg
  def hello(myarg) when is_bitstring(myarg), do: "Hello #{myarg}"
  def hello(_), do: raise "Unsupported Argument to hello()"

  @doc """
  Greet is our main greetings function.

  With a name and a supported language, it will return a valid greeting.
  With a name, it will return a valid greeting in English.

  ## Examples

      iex> Greetings.greet("Sally")
      "Hello Sally!"

      iex> Greetings.greet("Bob", :EN)
      "Hello Bob!"

      iex> Greetings.greet("Bob", "EN")
      "Hello Bob!"

      iex> Greetings.greet("Jose", "ES")
      "Hola Jose!"

      iex> Greetings.greet(7, "ES")
      "Hola Number 7!"

      iex> Greetings.greet("")
      "Hello Mystery Person!"

      iex> Greetings.greet()
      "Hello Nobody!"

  """
  def greet(name, lang \\ :EN)
  def greet(name, lang) when is_bitstring(name) or is_atom(name) do
    hello = lang |> LanguageHelpers.salutation()
    "#{hello} #{clean_name(name)}!"
  end
  # Task: when you get a number, change it to "Number <arg>" and recurse into greet()
  def greet(name, lang) when is_integer(name) do
    "Number #{name}" |> greet(lang)
  end
  # Task: when you get a list of names, join them with a comma
  def greet(names, lang) when is_list(names) do
    # IO.puts "list of names in #{lang}"
    # IO.inspect names
    names
    |> Enum.join(", ")
    |> greet(lang)
  end
  def greet(), do: "Hello Nobody!"


  @doc """
  An example of some quick string cleanup

  Trims whitespace and line breaks
  Cleans strange character encodings
  Forces name to capitalize all words

  ## Examples

      iex> Greetings.clean_name(" jes  ")
      "Jes"

      iex> Greetings.clean_name("")
      "Mystery Person"

      iex> Greetings.clean_name(nil)
      "Nobody"

      iex> Greetings.clean_name(:atom)
      "atom"
  """
  # Task: when you get "", return "Mystery Person"
  def clean_name(""), do: "Mystery Person"
  # Task: when you get nil, return "Nobody"
  def clean_name(nil), do: "Nobody"
  # Task: when you get a name which is an atom, transform it into a string
  def clean_name(name) when is_atom(name) do
    name
    |> Atom.to_string()
    |> clean_name()
  end
  # Hint: use more function definitions, do not edit the below definition
  def clean_name(name) when is_bitstring(name) do
    name
    |> String.trim
    |> String.normalize(:nfc)
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

end
