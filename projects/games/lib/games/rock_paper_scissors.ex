defmodule Games.RockPaperScissors do
  def play(opts \\ []) do
    if !opts[:guess], do: IO.puts("Welcome to Rock Paper Scissors")

    input = IO.gets("RPS Guess: ") |> String.trim()
    if input != "stop" do
      guess = input

      IO.puts(guess)
      play([guess: guess])
    end
  end
end
