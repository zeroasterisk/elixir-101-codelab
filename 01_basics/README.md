# Elixir 101 > Codelab 01: Basics

The rest of this codelab will be based on code you will fix and extend,
but this section is about learning how to use your shiny new tools and exploring some basics.

## Prep: 2 terminals

I suggest you setup 2 terminals, side by side, each taking up half of your screen.

In each, get into the code directory:

```sh
$ cd ~/your/code/path/elixir-101-codelab/01_basics
```

Open this README in one of them, and we will use the other for commands

## iex basic start

### iex -> hello world

You should be comfortable using `iex` and able to create a "hello world"

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

Note(2): the `:ok` is the return value from `IO.puts` and the `hello world` is the console output of the command.



### iex -> h() for help

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

## mix // start up a server

We are going to use `mix` to get some existing code up and running a web server, locally.

Learn more about the `mix` tool on
[docs](https://hexdocs.pm/mix/Mix.html) &
[elixirschool](https://elixirschool.com/en/lessons/basics/mix/).

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

Before we can start the code, we need to get the dependencies
(see `mix.exs` to see `ace` as the only listed dependency)

```sh
$ mix deps.get
Could not find Hex, which is needed to build dependency :ace
Shall I install Hex? (if running non-interactively, use "mix local.hex --force") [Yn] y
* creating /root/.mix/archives/hex-0.18.1
Resolving Hex dependencies...
Dependency resolution completed:
Unchanged:
  ace 0.15.11
  cookie 0.1.1
  hpack_erl 0.2.3
  raxx 0.14.14
  uuid 1.1.8
All dependencies up to date
```

Ok so you go ahead and try to start the server

```sh
$ mix run
[...]
06:46:16.291 [info]  Serving cleartext using HTTP/1 on port 8080
```

In your other terminal, you can test it with `curl`
(or I guess in a browser, if you really want).

```sh
$ curl http://localhost:8080
Hello, World!
```

----------------------

- [ ] iex -S mix -> Response.replace("<my name> was here")
- [ ] iex -S mix -> observer (kill a process)
- [ ] iex -S mix -> code change -> recompile
- [ ] mix test
- [ ] mix test.watch
- [ ] mix docs
