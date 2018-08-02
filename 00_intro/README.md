# Elixir 101 > Codelab 00: Intro

Before you get started, you should know some basics about the language.

Instead of my copying it here, go read:
* [elixirschool.com > basics](https://elixirschool.com/en/lessons/basics/basics/)
* [elixirschool.com > collections](https://elixirschool.com/en/lessons/basics/collections/)
* [elixirschool.com > pattern matching](https://elixirschool.com/en/lessons/basics/pattern-matching/) *(amazing!)*
* [elixirschool.com > pipe operator](https://elixirschool.com/en/lessons/basics/pipe-operator/) *(so nice!)*
And at least skim:
* [elixirschool.com > strings](https://elixirschool.com/en/lessons/basics/strings/)
* [elixirschool.com > enum](https://elixirschool.com/en/lessons/basics/enum/)
* [elixirschool.com > control structures](https://elixirschool.com/en/lessons/basics/control-structures/)
* [elixirschool.com > functions](https://elixirschool.com/en/lessons/basics/functions/)
* [elixirschool.com > modules](https://elixirschool.com/en/lessons/basics/modules/)
* [elixirschool.com > iex helpers](https://elixirschool.com/en/lessons/basics/iex-helpers/)

Yes, I know, that's a lot of reading...

Skim as needed and know you can reference it all later.

You should now feel comfortable with `iex` and making a "hello world" appear.

```sh
$ iex
Erlang/OTP 20 [erts-9.3.3.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.6.6) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Hit `enter` and see the prompt count increment (you should see `iex>`).

Type in `IO.puts("hello world")` and hit `enter`.

Note: the `:ok` is the return value from `IO.puts` and the `hello world` is the console output of the command.

```
iex> IO.puts("hello world")
hello world
:ok
```

Feel free to play a bit more with syntax, we will get into this more in the next sections.

```
iex> "hiya"
"hiya"
iex> a = "hiya"
"hiya"
iex> a
"hiya"
iex> IO.puts(a)
hiya
:ok
iex> IO.puts a
hiya
:ok
iex> a |> IO.puts()
hiya
:ok
iex> a |> String.upcase |> IO.puts
HIYA
:ok
iex> a
"hiya"
iex> "1,2,3,4" |> String.split(",") |> Enum.map(&String.to_integer/1) |> Enum.sum()
10
```
