defmodule Greetings do
  @moduledoc """
  This will create our Greeting text
  """
  @doc """
  Super simple greeting to the world
  """
  def hello(), do: :world

  @doc """
  Greet is our main entry point,
  accetping a language and a name

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
  def greet(name, lang \\ "EN")
  def greet(name, lang) when is_bitstring(name) do
    hello = lang |> salutation()
    "#{hello} #{clean_name(name)}!"
  end
  def greet(name, lang) when is_integer(name) do
    "Number #{name}" |> greet(lang)
  end
  def greet(), do: "Hello Nobody!"

  @doc """
  hello in various languages

  ## Examples

      iex> Greetings.salutation("EN")
      "Hello"

      iex> Greetings.salutation("PT")
      "Olà"
  """
  def salutation("EN"), do: "Hello"
  def salutation("US"), do: "Howdy"
  def salutation("ES"), do: "Hola"
  def salutation("DE"), do: ["Hallo", "Guten Tag"] |> Enum.random
  def salutation("FR"), do: "Bonjour"
  def salutation("IT"), do: "Ciao"
  def salutation("PT"), do: "Olà"
  def salutation("HI"), do: "Namaste"
  def salutation("FA"), do: "Salaam"
  def salutation("RU"), do: "Zdras-tvuy-te"
  def salutation(_), do: "Beep beep"

  @doc """
  An example of some quick string cleanup

  ## Examples

      iex> Greetings.clean_name(" jes  ")
      "Jes"
  """
  def clean_name(""), do: "Mystery Person"
  def clean_name(nil), do: "Nobody"
  def clean_name(name) do
    name
    |> String.trim
    |> String.normalize(:nfc)
    |> String.capitalize
  end

end
