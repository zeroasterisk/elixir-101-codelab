defmodule LanguageHelpers do

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
    lang |> Atom.to_string() |> guess()
  end
  def guess(lang) when is_bitstring(lang) do
    guessed_language = lang
                       |> String.trim()
                       |> String.upcase()
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
  def salutation(:ES), do: "Hola"
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
  def salutation(_term, nil), do: "Beep beep"
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
