defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help option" do
    assert parse_args([ "-h", "anything" ]) == :help
    assert parse_args([ "--help", "anything" ]) == :help
  end

  test "three values returned if three given" do
    assert parse_args([ "user", "project", "4" ]) == { "user", "project", 4 }
  end

  test "count is defaulted if two values given" do
    assert parse_args([ "user", "project" ]) == { "user", "project", 99 }
  end

  test "if any args given :help is returned" do
    assert parse_args([]) == :none
  end
end
