defmodule Greetings do
  use Ace.HTTP.Service, [cleartext: true]

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
