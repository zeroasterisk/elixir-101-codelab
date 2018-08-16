# Elixir 101 > Codelab 01: Greetings

All of the sections of this codelab will require you to **edit the code**,
fixing errors and adding functionality.

*Do Not Edit the tests, nor the examples in docblocks*

You can always review the solutions to see a functional implementation,
but there are many ways to solve any of these problems.

This section will get you familiar with some of the
basic code syntax and highlight
a few of the interesting features of Elixir.

Just as importantly, it will expose you to the developer tooling,
and simulate actually working in Elixir (a bit) beyond a "hello world".

But before we get into the code, lets get you familiar with our tools.

## Prep: 2 terminals / windows

I suggest you setup 2 panes, side by side,
each taking up half of your screen.

One should be a means of editing code (IDE, `vim`, etc),
and one for a running commands.

In each, get into the code directory:

```sh
$ cd ~/your/code/path/elixir-101-codelab/01_greetings
```

NOTE: also open this README (in your editor or browser or whatever)

### mix - get dependencies, compile code, and start services

In a bit, we are going to use `mix` to get our dependencies.

We can use `mix` for a lot of other things too.

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

### mix deps.get - to get dependancies

Before we can start our code, we need to get it's dependencies.

You can see all of the dependencies in `mix.exs`.

There is also a `mix.lock` file which stores explicit versions.

For this codelab section, we are only including a single dependency,
`test.watch` which will make your life easier when testing.
It will execute tests and re-run all tests when you edit files (yay TDD).

You should be able to execute the mix task `deps.get` to get it.

> NOTE you may get the "Could not find Hex" prompt, say "y"

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

Errors? Ask for help or Google it.
- check elixir version?
- `rm -rf _build mix.lock; mix deps.get`

### iex -S mix (opens your code in the REPL)

You can run code with `mix run` and run tests with `mix test`
but to start with, we can also open `iex` with our code compiled in.

In this case we will trigger `iex` with `-S` which stands for `SCRIPT`,
it will cause `mix` to compile our code and run it within `iex`.

```sh
$ iex -S mix
iex> Greetings.hello
:not_yet_world
```

> Pro Tip: You can use `TAB` completion inside `iex`
> and you can use the `UP` arrow key to repeat previously typed commands.

## Task 2: change `:not_yet_world` to `:world`

Right now the function `Greetings.hello()` returns `:not_yet_world`

You can see this by running some tests.

You'll notice several other test failing too... We will get to those.


```sh
$ mix test

  1) test hello says hello to the world (GreetingsTest)
     test/greetings_test.exs:7
     Assertion with == failed
     code:  assert Greetings.hello() == :world
     left:  :not_yet_world
     right: :world
     stacktrace:
       test/greetings_test.exs:8: (test)
```

If you want, you can run `mix test.watch` and it will re-run tests for you as you edit files.

Or you can run `iex -S mix` and play with your code as you edit it.

> Pro Tip: within `iex` you can recompile a module after you edit it with `r ModuleName`

```
iex> r Greetings
warning: redefining module Greetings (current version loaded from _build/dev/lib/ex101_greetings/ebin/Elixir.Greetings.beam)
  lib/greetings.ex:1

{:reloaded, Greetings, [Greetings]}
```

For now, edit `./lib/greetings.exs` and change `:not_yet_world` to `:world`

Now run tests again...
You should notice 2 fewer failures. *(one docblock test, and one test file test)*

## Task 3: make all tests pass

You will need to make 2 new copies of the `hello()` function to make the tests pass.

One of them will accept an atom and simply return it.

One of them will accept a string, and return `"Hello <string>"`.

> Hint: use a guard clause on the function, to require a specific type of argument.

> Note: this is really the meat of the section.
> Use the solution folder if you need to or ask someone nearby for help.
> It's ok if it's not the "elixir way",
> just get the test to pass, then you can refactor it.

## Task 4: generate documentation

We have pretty docblocks, lets turn them into pretty documentation.

- Install the `ex_doc` hex package (google it)
- Use it to generate documentation (should be on the package's README/docs)
- View the documentation and marvel at how glorious it is

## Task 5: generate test coverage report

**Skip this section if you are not on Elixir 1.7+ or if you are behind**

We have some tests, which now, all pass... is it enough tests?

NOTE: this will be the first time you will edit the tests files.

- Generate a test coverage report
- Take a look at the HTML file generated in the new `cover` directory
- Figure out how to get it to 100% coverage (add a new test)
- Ensure all tests still pass

> Hint: Coverage is now included in the core test suite as of `v1.7`,
> beware of external packages and modules.
> You should not need to install anything.

## Bonus: run static code analysis

Try out
[credo](https://github.com/rrrene/credo)
a static code analysis tool for the Elixir language
with a focus on code consistency and teaching.

Try out
[dialyxir](https://github.com/jeremyjh/dialyxir)
which is an elixir wrapper for dialyzer,
[read more](https://elixirschool.com/en/lessons/specifics/debugging/).

## Done

Did you make it here?

Sweet!!!!  Great work!

- help out someone next to you
- ask questions of the instructor
- refactor your code

Did you encounter a problem?

- ask questions of the person next to you
- ask questions of the instructor
- look in the solutions directory
- file an issue on github
- refactor the starting code and submit a PR to the repo

Ready to go on?

Open the next folder and carry on.
