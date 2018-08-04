defmodule Greetings do
  use Ace.HTTP.Service, [cleartext: true]

  """
  Handle web requests from ACE and reply with a greeting

  In the first implementation the `greeting` is a variable passed in the GET querystring.
  If you do not pass this querystring variable, this function will not execute,
  because Elixir's pattern matching will not see the correct arguments.

  In the second implementation the name variable is passed in the path to the GET request.
  again, it will only match if the arguments are in exactly this pattern.

  In the last implementation, we ignore arguments (except for airity)
  so it is a catchall implementation.

  If we didn't have it, we would get an "function not found" error when not one of the above cases.
  """
  def handle_request(
    %{method: :GET, path: []},
    %{greeting: greeting})
  do
    response(:ok)
    |> set_header("content-type", "text/plain")
    |> set_body("#{greeting}, World!")
  end

  def handle_request(
    %{method: :GET, path: ["name", name]},
    _state)
  do
    response(:ok)
    |> set_header("content-type", "text/plain")
    |> set_body("Hello, #{name}!")
  end

  def handle_request(_request, _state) do
    response(:not_found)
    |> set_header("content-type", "text/plain")
    |> set_body("Sorry, nothing here.")
  end
end
