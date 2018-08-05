# Elixir 101 > Codelab 01: Greetings

All of the sections of this codelab will requires you to
view and edit the code, fixing errors and adding functionality.
You can always review the solutions to see a functional implementation,
but there are many ways to solve any of these problems.

This section will get you familiar with some of the basic code
syntax and highlight a few of the interesting features of the language,
as well as expose you to the tooling for development.

But before we get into the code, lets get you familiar with our tools.

## Prep: 2 terminals

I suggest you setup 2 terminals, side by side, each taking up half of your screen.

In each, get into the code directory:

```sh
$ cd ~/your/code/path/elixir-101-codelab/01_greetings
```

Open this README in one of them, and we will use the other for commands

## task 1: install dependencies and start a REPL with code

For future tasks, you will have less guidance,
but since this is the first task, I'll walk you through it.

### iex -> hello world

You should be comfortable using `iex` and able to create a "hello world".

This is not at all related to the code, yet.

```
$ iex
Erlang/OTP 20 [erts-9.3.3.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

Interactive Elixir (1.6.6) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> "hello world"
"hello world"
iex(2)> IO.puts "hello world"
hello world
:ok
```

> Note(2): the `:ok` is the return value from `IO.puts` and the `hello world` is the console output of the command.


You can use the `h` helper for more information on any function (including yours) from `iex`

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

You can use `CTRL+C` twice, to exit the REPL.

Go ahead and exit, we will come back to `iex` in a bit.

### mix - get dependencies, compile code, and start services

We are going to use `mix` to get our dependencies.
We can use it for a lot of other things too.

```sh
$ mix help

Usage: mix [task]

Examples:

    mix             - Invokes the default task (mix run) in a project
    mix new PATH    - Creates a new Elixir project at the given path
    mix help        - Lists all available tasks
    mix help TASK   - Prints documentation for a given task

$ mix help deps.get

                                  mix deps.get

Gets all out of date dependencies, i.e. dependencies that are not available or
have an invalid lock.

## Command line options

  • --only - only fetches dependencies for given environment
  • --no-archives-check - does not check archives before fetching deps
```

> Learn more about the `mix` tool on
> [docs](https://hexdocs.pm/mix/Mix.html) &
> [elixirschool](https://elixirschool.com/en/lessons/basics/mix/).


Before we can start our code, we need to get it's dependencies,
which you can see in `mix.exs`.

For this codelab section, we are only including a `test.watch`
to make your life easier later.

You should be able to execute the mix task `deps.get` to get it.

```sh
$ mix deps.get
Could not find Hex, which is needed to build dependency :mix_test_watch
Shall I install Hex? (if running non-interactively, use "mix local.hex --force") [Yn] y
* creating /root/.mix/archives/hex-0.18.1
Resolving Hex dependencies...
Dependency resolution completed:
New:
  file_system 0.2.6
  mix_test_watch 0.8.0
All dependencies up to date
```

### iex -S mix (opens your code in the REPL)

You can run code with `mix run` and run tests with `mix test`
but to start with, we can open `iex` but this time with our code.

In this case we will trigger `iex` with `-S` which stands for `SCRIPT`,
it will cause `mix` to compile our code and run it within `iex`.

```sh
$ iex -S mix
iex> Greetings.hello
:not_yet_world
```

> Hint: You can use `TAB` completion inside `iex`
> Hint: You can use the `UP` arrow key to repeat previously typed commands

## task 2: change `:not_yet_world` to `:world`

Edit code to make the `Greetings.hello` function return the atom `:world`

```sh
$ iex -S mix
iex> Greetings.hello
:world
```

Hint: the code is in `./lib/greetings.exs`
Hint: within `iex` you can recompile a module as follows:

```
iex> r Greetings
warning: redefining module Greetings (current version loaded from _build/dev/lib/ex101_greetings/ebin/Elixir.Greetings.beam)
  lib/greetings.ex:1

{:reloaded, Greetings, [Greetings]}
```

## task X: make all tests pass

The bulk of your code editing for this section, will now commence.

**Try to make all tests pass.**

You can start a test watcher in one terminal, and edit code in the other window.

```sh
$ mix test.watch
```


## task X: generate documentation

All tests

