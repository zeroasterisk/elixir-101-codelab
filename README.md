# Elixir 101

[TOC]

Elixir 101 is a codelab for learning the basics of the Elixir programming
language.

## About Elixir

Elixir is a functional language with excellent tooling and a growing community, which is a built on top of Erlang and runs on the BEAM VM.  It is known for excellent parallelization and process stability and recovery.

Videos to get you warmed up:
* [Elixir Documentary](http://doc.honeypot.io/elixir-documentary-2018/)
  (12 min video)
  A developer focused documentary on Elixir origin story
* [Elixir in 9 Minutes](https://www.youtube.com/watch?v=hht9s6nAAx8)
  (9 min video)
  Dave Thomas quick into to Elixir (coding example)
* [Elixir in 30 Minutes](https://www.youtube.com/watch?v=a-off4Vznjs)
  (30 min video)
  Dave Thomas "longer" into to Elixir (coding example)

## Prework

Before coming to the class I recommend that you have a working Elixir install,
or Docker runtime, and have downloaded these codelab files.

### Installing Elixir

The installation instructions are on
[the Elixir homepage](https://elixir-lang.org/install.html):

```sh
docker run -it -v --rm elixir bash
```

After installation, you will have three new executables: `iex`, `elixir` and `elixirc`

```sh
# check installed version
elixir --version
# launch REPL
iex
```

### Download the codelab files

The codelab files are available from github.

```sh
git clone https://github.com/zeroasterisk/elixir-101-codelab.git
cd elixir-101-codelab
```

Alternatively, you can
[download as a zip file](https://github.com/zeroasterisk/elixir-101-codelab/archive/master.zip).

### Testing the codelab files

The following will run tests in each of the sub-project folders inside this repo.

```sh
cd elixir-101-codelab
find . -maxdepth 1 -type d \( ! -name . \) \( ! -name .git \) -exec bash -c  "cd '{}' && mix test" \;
```

If all the tests pass then you are good to go.

If some of the tests fail I would appreciate if you send details to alanblount@google.com.

## Codelab

The codelab is split into sub-projects, and instructions are in the README in each folder, as well as in files.

Simply start from the top and fix the code as you go.

