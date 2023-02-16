defmodule Games.Menu do
  def display do
    display = ~S(
Select a game:
1. Guessing Game
2. Rock Paper Scissors
3. Wordle)

    IO.puts(display)
    get_and_parse_input()
  end

  def get_and_parse_input() do
    selection = IO.gets("Selection: ") |> String.trim()

    replay = case selection do
      "1" ->
        Games.GuessingGame.play()
        true
      "2" ->
        Games.RockPaperScissors.play()
        true
      "3" ->
        Games.Wordle.play()
        true
      "stop" -> false
      _ ->
        IO.puts("Invalid selection, please choose from 1..3 or 'stop'")
        true
    end

    if replay, do: get_and_parse_input()

    :ok
  end
end
