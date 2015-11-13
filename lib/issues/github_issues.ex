defmodule Issues.GithubIssues do
  @user_agent [ { "User-agent", "fabio.petrucci@gmail.com" } ]
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issue_url(user, project)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  defp issue_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    { :ok, :jsx.decode(body) }
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 404, body: body}}) do
    { :ok, :jsx.decode(body) }
  end

  defp handle_response({:error, %HTTPoison.Response{ status_code: ___, body: body}}) do
    { :error, :jsx.decode(body) }
  end
end
