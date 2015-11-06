defmodule Issues.GithubIssuesTest do
  use ExUnit.Case

  import Issues.GithubIssues, only: [ fetch: 2 ]

  test "empty issues for 'mbientlab' user and 'Metawear-AndroidAPI' project" do
    assert Issues.GithubIssues.fetch('mbientlab', 'Metawear-AndroidAPI') == { :ok, [] }
  end

  test "not found for unavailable user or project" do
    assert Issues.GithubIssues.fetch('unavailable', 'Metawear-AndroidAPI') == { :ok, [{"message", "Not Found"}, {"documentation_url", "https://developer.github.com/v3"}] }
  end
end
