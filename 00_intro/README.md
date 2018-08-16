# Elixir 101 > Codelab 00: Intro

Before you do anything, you should have
[Elixir installed](https://elixir-lang.org/install.html).

Notice that in this module, there is no code.
Here we will just play with Elixir and accomplish a few "hello worlds".

## Prep: 2 terminals / windows

I suggest you setup 2 panes, side by side,
each taking up half of your screen.

One for this readme, and one for running commands.

Get into the code directory:

```sh
$ cd ~/your/code/path/elixir-101-codelab/00_intro
```

## Task 1: "hello world" with the iex REPL

For future tasks, you will have less guidance,
but since this is the first task, I'll walk you through it.

### iex -> hello world

You should be comfortable using `iex` and able to create a "hello world".

```
$ iex
Erlang/OTP 20 [erts-9.3.3.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.6.6) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> "hello world"
"hello world"
iex(2)>
```

The string `"hello world"` returned the value `"hello world"`.

Note: the number in the prompt increments on every command (unless you restart iex) - I will omit those numbers going forward

Now lets assign a value to the variable `x` and use it.

```
iex> x = "hello world"
"hello world"
iex> x
"hello world"
iex> String.upcase(x)
"HELLO WORLD"
```

We are returning the string as a response, but we can also use `IO.puts` to "log" the value to our console.

```
iex> IO.puts(x)
hello world
:ok
iex> IO.puts x
hello world
:ok
```

Note: the `:ok` is the return value from `IO.puts` and the `hello world` is the console output of the command.

### iex -> h get help about a command

You can use the `h` helper for more information on any function (including those you will write) from `iex`

```
iex> h IO.puts

                        def puts(device \\ :stdio, item)

    @spec puts(device(), chardata() | String.Chars.t()) :: :ok

Writes item to the given device, similar to write/2, but adds a newline at the end.

By default, the device is the standard output. It returns :ok if it succeeds.

## Examples

    IO.puts "Hello World!"
    #=> Hello World!

    IO.puts :stderr, "error"
    #=> error
```

Try to lookup help for `String.upcase`.

### iex -> more playing with examples

Feel free to play a bit more with syntax, we will get into this more in the next sections.

> Pro Tip: You can use `TAB` to complete commands and `UP` to repeat previous commands.

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
iex> a |> String.upcase
"HIYA"
iex> a |> String.reverse
"AYIH"
iex> a
"hiya"
iex> "1,2,3,4" |> String.split(",")
["1", "2", "3", "4"]
iex> "1" |> String.to_integer()
1
iex> [1, 2, 3, 4] |> Enum.sum()
10
iex> "1,2,3,4" |> String.split(",") |> Enum.map(&String.to_integer/1) |> Enum.sum()
10
```

### exit iex

You can use `CTRL+C` twice, to exit the REPL.

Go ahead and exit, we will come back to `iex` in a bit.

## Self Study - a lot more information exists here

Before you go on, you can find out a lot more at various places...

Here are some highlighted areas of Elixirschool.com:
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

