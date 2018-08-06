defmodule LanguageHelpersTest do
  use ExUnit.Case
  doctest LanguageHelpers

  describe "guess" do
    # guess will take in a variety of inputs
    # and return either a "valid" language atom or nil
    test "Guessing Language for nil returns nil" do
      assert LanguageHelpers.guess(nil) == nil
    end
    test "Guessing Language for en returns :EN" do
      assert LanguageHelpers.guess("en") == :EN
    end
    test "Guessing Language for :en returns :EN" do
      assert LanguageHelpers.guess(:en) == :EN
    end
    test "Guessing Language for ' en ' returns :EN" do
      assert LanguageHelpers.guess(" en ") == :EN
    end
    test "Guessing Language for 'xx' returns nil (non-lang)" do
      assert LanguageHelpers.guess("xx") == nil
    end
    test "Guessing Language for 'XX' returns nil (non-lang)" do
      assert LanguageHelpers.guess("XX") == nil
    end
    test "Guessing Language for :XX returns nil (non-lang)" do
      assert LanguageHelpers.guess(:XX) == nil
    end
    test "Guessing Language for 123 returns nil (non-string)" do
      assert LanguageHelpers.guess(123) == nil
    end
  end

  describe "salutation" do
    # salutation takes a language code, a country, or whatever
    # and returns a "hello" in that language
    # (opportunity for more functionality here)
    test "salutation for EN is Hello" do
      assert LanguageHelpers.salutation("EN") == "Hello"
    end
    test "salutation for en is Hello (case doesn't matter)" do
      assert LanguageHelpers.salutation("en") == "Hello"
    end
    test "salutation for :DE is one of [Hallo, Guten Tag]" do
      # Task 5: add coverage for a random value
      allowed = ["Hallo", "Guten Tag"]
      value = LanguageHelpers.salutation(:DE)
      assert Enum.member?(allowed, value) == true
    end
  end

end
