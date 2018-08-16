defmodule LanguageHelpers do
  @moduledoc """
  This is a simple utility module to manage language specific functionality.

  This is currently hardcoded, but could be re-implemented with
  internal state, a DB lookup, or API access.

  At some point, it could become it's own top level module,
  a library which could be shared across projects and managed independantly.

  For now, it's really simple and limited.
  """

  @supported_languages [
    :EN,
    :ES,
    :DE,
    :FR,
    :IT,
    :PT,
    :HI,
    :FA,
    :RU,
  ]

  @doc """
  Guess a language code, and return either a langugage code or nil

  ## Examples

      iex> LanguageHelpers.guess("en")
      :EN

      iex> LanguageHelpers.guess("AAAA")
      nil
  """
  def guess(lang) when is_atom(lang) do
    # Task: we got an atom...
    #   but not a valid one or we wouldn't have to guess
    #   try converting the atom to a string, and recursing into guess()
    lang |> Atom.to_string() |> guess()
  end
  def guess(lang) when is_bitstring(lang) do
    guessed_language = lang
    # Task: get rid of whitespace
                       |> String.trim()
    # Task: make all upper case
                       |> String.upcase()
    # Task: make the string into an atom for easy comparison
                       |> String.to_atom()
    case Enum.member?(@supported_languages, guessed_language) do
      true -> guessed_language
      false -> nil
    end
  end
  def guess(_), do: nil

  @doc """
  Return "hello" in supported languages

  ## Examples

      iex> LanguageHelpers.salutation(:EN)
      "Hello"

      iex> LanguageHelpers.salutation(:PT)
      "Olà"
  """
  def salutation(:EN), do: "Hello"
  # Task: add an entry for :ES = "Hola"
  def salutation(:DE), do: ["Hallo", "Guten Tag"] |> Enum.random
  def salutation(:FR), do: "Bonjour"
  def salutation(:IT), do: "Ciao"
  def salutation(:PT), do: "Olà"
  def salutation(:HI), do: "Namaste"
  def salutation(:FA), do: "Salaam"
  def salutation(:RU), do: "Zdras-tvuy-te"
  def salutation(:TX), do: "Howdy" # easter egg
  # we got some kind of a string... is it a language?
  #   recurse into salutation(term, guessed_lang)
  def salutation(term) when is_bitstring(term) or is_atom(term) do
    guessed_lang = LanguageHelpers.guess(term)
    salutation(term, guessed_lang)
    # this is equivalent to:
    #   term |> salutation(term |> LanguageHelpers.guess())
  end
  # we got 1 argument which is not a string
  #   this could be an exception
  #   but we are not going to deal with that now
  def salutation(_), do: "Honk"
  # we have passed in a term and a guessed_lang
  # we could not guess the language (nil)
  #   return "Beep beep"
  def salutation(_term, nil), do: "Could Not Guess Language"
  # lookout! Our term and guessed_lang are the same
  #   return "Grrrrr"
  def salutation(term, guessed_lang) when term == guessed_lang, do: "Grrrrr"
  # we could guess a language
  #   recurse into salutation with only the guessed_lang
  def salutation(_term, guessed_lang) when is_atom(guessed_lang) do
    salutation(guessed_lang)
  end
  # we couldn't guess a language
  #   and somehow our guess wasn't nil nor a string
  #   return "Impossible"
  def salutation(_term, _guessed_language), do: "Impossible"

end
