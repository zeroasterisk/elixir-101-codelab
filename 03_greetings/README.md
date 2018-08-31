# Elixir 101 > Codelab 03: Greetings (greet)

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
$ cd ~/your/code/path/elixir-101-codelab/03_greetings
```

NOTE: also open this README (in your editor or browser or whatever)

## Task 1: fix all tests

We have added a new file called `./lib/language_helpers.ex` (and it's test file).

These tools set the stage for the future `greet()` function... once they are working.

If you run tests, you'll notice several failing, from both the docblocks and the test files.
(many of these will be fixed together)


```sh
$ mix test

  1) test guess Guessing Language for nil returns nil (LanguageHelpersTest)
     test/language_helpers_test.exs:8
     Assertion with == failed
     code:  assert LanguageHelpers.guess(nil) == nil
     left:  :accomplish_tasks
     right: nil
     stacktrace:
       test/language_helpers_test.exs:9: (test)
```

If you want, you can run `mix test.watch` and it will re-run tests for you as you edit files.

Or you can run `iex -S mix` and play with your code as you edit it.

> Pro Tip: within `iex` you can recompile a module after you edit it with `r ModuleName`

```
iex> r LanguageHelpers
warning: redefining module LanguageHelpers (current version loaded from _build/dev/lib/ex101_greetings/ebin/Elixir.LanguageHelpers.beam)
  lib/language_helpers.ex:1

{:reloaded, LanguageHelpers, [LanguageHelpers]}
```

## Task 2: generate documentation

We have pretty docblocks, lets turn them into pretty documentation.

- Install the `ex_doc` hex package (google it)
- Use it to generate documentation (should be on the package's README/docs)
- View the documentation and marvel at how glorious it is

## Task 3: generate test coverage report

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
