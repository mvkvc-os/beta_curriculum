defmodule Games.CLI do
  @moduledoc """
  CLI is the command line interface for the games library.
  """

  @doc """
  Start the CLI.
  """
  def main(_args) do
    Games.Menu.display()
  end
end
