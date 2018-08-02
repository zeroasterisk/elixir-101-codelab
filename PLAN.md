# Codelab Plan

# Introduction

Existing code without bugs (we can hope) and we will explore our tools via CLI.

- [ ] iex -> hello world
- [ ] mix help
- [ ] mix start (error)
- [ ] mix deps.get
- [ ] mix start (curl to test)
- [ ] iex -S mix -> Response.replace("<my name> was here")
- [ ] iex -S mix -> observer (kill a process)
- [ ] iex -S mix -> code change -> recompile
- [ ] mix test
- [ ] mix test.watch
- [ ] mix docs

# Basics

Fix these bugs, making all tests pass (TDD).

- [ ] make ResponseOptions.add_string allow only a string (hint: guard)
- [ ] make ResponseOptions.add_string actually add the string to the state (hint: Enum)
- [ ] make ResponseOptions.add_strings allow only an array of strings (hint: guard)
- [ ] make ResponseOptions.add_strings actually add all of the strings to the state (hint: Recursive loop)
- [ ] make ResponseOptions.add! correctly map to appropriate other function
- [ ] make ResponseOptions.add! correctly throw an exception if an invalid argument was sent
- [ ] make ResponseOptions.add correctly map to appropriate other function
- [ ] make ResponseOptions.add correctly return an :error atom if the argument is invalid
- [ ] make ResponseOptions.add correctly transform an atom argument into a string
- [ ] make ResponseOptions.rand return a random option from the list
- [ ] make ResponseOptions.rand return nil if the list is empty

# Processes

Fix these bugs, making all tests pass (TDD).

ResponseWorker
ResponseSupervisor
iex -> set new state
iex -> observer -> kill process
