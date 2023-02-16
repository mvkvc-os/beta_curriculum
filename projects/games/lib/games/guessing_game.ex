defmodule Games.GuessingGame do
  def play(opts \\ []) do
    if !opts[:guess], do: IO.puts("Welcome to Guessing Game")

    input = IO.gets("GG Guess: ") |> String.trim()
    if input != "stop" do
      guess = input

      IO.puts(guess)
      play([guess: guess])
    end
  end
end
