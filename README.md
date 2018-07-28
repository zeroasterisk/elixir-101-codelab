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

You have a few options, pick one you're comfortable with.

#### Option 1. Run elixir from a free GCP Shell

You can run elixir on a server, for free, via
[Google Cloud Platform Shell](https://cloud.google.com/shell/docs/)
or on any remote server on which you can install Elixir.

```sh
$ sudo apt-get update; sudo apt-get install elixir -y
```

#### Option 2. Install elixir on your workstation

You can [install elixir on your local machine](https://elixir-lang.org/install.html).

It has easy install methods for most *nix and osx and even windows.


#### Option 3. Run elixir via a docker container on your machine

If you have docker, you can simply run elixir inside of docker, no install needed.

An example of running via docker:

```sh
# grab elixir
$ docker pull elixir

# get into bash, inside the container
$ docker run -it --rm elixir bash

# get into iex, with PWD mapped to /app and setup as the working directory
$ docker run -it --rm --name ex101 -v "$PWD":/app -w /app elixir iex
```

If you decide to use docker, you can setup an
[alias](https://davidwalsh.name/alias-bash)
in the `.bashrc` to run elixir commands inside docker, like so:

```
# paste the following into .bashrc or .profile or whatever
elixir() {
  docker run -it --rm --name ex101 -v "$(pwd)":/app -w /app elixir $1
}
iex() {
  docker run -it --rm --name ex101 -v "$(pwd)":/app -w /app elixir iex
}
```

### Verify your Elixir Install

After installation, you will have three new executables: `iex`, `elixir` and `elixirc`

1.  Check installed version
    ```sh
    $ elixir --version
    ```
2.  Launch `iex` the Elixir REPL and do a hello world

    ```sh
    $ iex
    Erlang/OTP 20 [erts-9.3.3.2] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:10] [hipe] [kernel-poll:false]

    Interactive Elixir (1.6.6) - press Ctrl+C to exit (type h() ENTER for help)
    iex(1)> IO.puts "hello world"
    hello world
    :ok
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
find . -maxdepth 1 -type d \( ! -name . \) \( ! -name .git \) -exec bash \
  -c  "cd '{}' && docker run -it --rm --name e1 -v "$PWD":/app -w /app mix test" \;
```

If all the tests pass then you are good to go.

If some of the tests fail I would appreciate if you send details to alanblount@google.com.

## Codelab

The codelab is split into sub-projects, and instructions are in the README in each folder, as well as in files.

Simply start from the top and fix the code as you go, and watch tests turn green.

