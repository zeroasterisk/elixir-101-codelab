defmodule Greetings do
  @moduledoc """
  This will create our Greeting text: "Hello World"

  For this contrived example we have
  - hello() which just returns :world
  - greet(name, lang = [:EN]) which returns a language specific "Hello $name!"
  """

  @doc """
  Super simple greeting to the world

  It takes no arguments, and returns :world
  """
  # Task: change :not_yet_world to :world
  def hello(), do: :world

  @doc """
  Greet is our main entry point,
  accetping a language and a name
  returning a greeting in the correct language.

  ## Examples

      iex> Greetings.greet("Sally")
      "Hello Sally!"

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
  def greet(name, lang) when is_integer(name) do
    "Number #{name}" |> greet(lang)
  end
  # Task: when you get a list of names, join them with a comma
  def greet(names, lang) when is_list(names) do
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
