defmodule LanguageHelpers do
  @moduledoc """
  This is a simple utility module to manage language specific functionality.

  This is currently hardcoded, but could be re-implemented with
  internal state, a DB lookup, or API access.

  At some point, it could become it's own top level module,
  a library which could be shared across projects and managed independantly.

  For now, it's really simple and limited.
  """

  # This is a constant for the module
  # you shouldn't need to change this list, unless you want to add different languages
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
  Guess a language code based on some input,
  and return either a supported langugage code or nil

  NOTE we may accept an atom or a string
    we only "support" one of the above atoms
    but if we can guess, let's do so

  ## Examples

      iex> LanguageHelpers.guess(:EN)
      :EN

      iex> LanguageHelpers.guess(:en)
      :EN

      iex> LanguageHelpers.guess("en")
      :EN

      iex> LanguageHelpers.guess("DE")
      :DE

      iex> LanguageHelpers.guess("not_valid_lang")
      nil

      iex> LanguageHelpers.guess(:not_valid_lang)
      nil

      iex> LanguageHelpers.guess(nil)
      nil

      iex> LanguageHelpers.guess(true)
      nil
  """
  def guess(lang) when is_atom(lang) do
    # Task: we got an atom...
    #   but probably not a valid one or we wouldn't have to guess
    #   try converting the atom to a string, and recursing into guess()
    :accomplish_tasks
  end
  def guess(lang) when is_bitstring(lang) do
    # Task: we got a string,
    #   and we want to normalize it compare it to a list of atoms
    guessed_language = lang
    # Task: get rid of whitespace
    # Task: make all upper case
    # Task: make the string into an atom for easy comparison
    # Task: determine if the guessed_language is in @supported_languages,
    #   if so return it, otherwise return nil
    :accomplish_tasks
  end
  # if you get anything else, return nil (done for you)
  def guess(_), do: nil

  @doc """
  Return "hello" in supported languages,
  and if you don't know the language, guess it.

  ## Examples

      iex> LanguageHelpers.salutation(:EN)
      "Hello"

      iex> LanguageHelpers.salutation(:PT)
      "Olà"

      iex> LanguageHelpers.salutation("PT")
      "Olà"

      iex> LanguageHelpers.salutation(:ES)
      "Hola"

  """
  # we got 1 argument which is nil
  #   this is likely an invalid guess()
  #   we are going to raise an exception (ugly)
  def salutation(nil), do: raise "Could not determine language"
  def salutation(:EN), do: "Hello"
  # Task: add an entry for :ES = "Hola"
  def salutation(:FR), do: "Bonjour"
  def salutation(:IT), do: "Ciao"
  def salutation(:PT), do: "Olà"
  # Bonus: we are returning one of these 2 options, randomly
  def salutation(:DE), do: ["Hallo", "Guten Tag"] |> Enum.random
  def salutation(:HI), do: "Namaste"
  def salutation(:FA), do: "Salaam"
  def salutation(:RU), do: "Zdras-tvuy-te"
  def salutation(:TX), do: "Howdy" # easter egg
  # we got something... is it a language?
  def salutation(term) when is_bitstring(term) or is_atom(term) do
    # Task: use LanguageHelpers.guess() and recurse into salutation()
    :accomplish_tasks
  end
  # we got 1 argument which is not a string or an atom
  #   this could be a bad argument or it could be an invalid guess()
  #   either way, we are going to raise an exception (ugly)
  def salutation(_), do: raise "Enter a valid language"

end
