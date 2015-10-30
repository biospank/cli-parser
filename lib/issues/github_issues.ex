defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "Elixirdave@pragprog.com" } ]

  def fetch(user, project) do
    issue_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  defp issue_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    { :ok, body }
  end

  defp handle_response({:error, %HTTPoison.Response{ status_code: ___, body: body}}) do
    { :error, body }
  end
end
