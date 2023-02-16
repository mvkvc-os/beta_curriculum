defmodule Games.Wordle do
  @words "priv/words.txt"
  @guesses "priv/guesses.txt"

  def get_text(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Enum.to_list()
  end

  def play(opts \\ []) do
    word = Keyword.get(opts, :word, Enum.random(get_text(@words)))
    guess_list = Keyword.get(opts, :guess_list, get_text(@guesses))
    lives = Keyword.get(opts, :lives, 5)

    if !opts[:word] do
      IO.puts("Welcome to Wordle")
      IO.puts("Enter a word with length: #{String.length(word)}")
    end

    guess = IO.gets("Guess: ") |> String.trim()

    if !Enum.member?(guess_list, guess) do
      IO.puts("Invalid guess word")
      play([word: word, guess_list: guess_list, lives: lives])
    end

    result =
      case feedback(word, guess) do
        {:ok, result} ->
          result

        {:error, error} ->
          IO.puts(error)
          play([word: word, guess_list: guess_list, lives: lives])
      end

    cond do
      guess == word ->
        IO.puts("You win!")

      lives == 1 ->
        IO.puts("You lose! The word was #{word}")

      true ->
        IO.puts("You have #{lives - 1} lives left")
        IO.puts(Enum.join(result, " "))
        play([word: word, guess_list: guess_list, lives: lives - 1])
    end
  end

  def feedback(word, guess) do
    cond do
      String.length(word) != String.length(guess) ->
        {:error, "Guess must be length #{String.length(word)}"}

      String.match?(guess, ~r/[^a-zA-Z]/) ->
        {:error, "Word must only contain letters"}

      true ->
        word = String.downcase(word) |> String.graphemes()
        guess = String.downcase(guess) |> String.graphemes()

        char_counts = Enum.frequencies(word)

        map_decr = fn map, k -> Map.update(map, k, 0, &(&1 - 1)) end

        unmatched_char_counts = Enum.zip(word, guess)
        |> Enum.reduce(char_counts, fn {w, g}, acc ->
          if w == g, do: map_decr.(acc, g), else: acc
        end)

        {_, result} =
          Enum.zip_reduce(word, guess, {unmatched_char_counts, []}, fn w, g, {rem_chars, result} ->
            cond do
              w == g ->
                {rem_chars, [:green | result]}

              Map.get(rem_chars, g, 0) > 0 ->
                {map_decr.(rem_chars, g), [:yellow | result]}

              true ->
                {rem_chars, [:gray | result]}
            end
          end)

        {:ok, Enum.reverse(result)}
    end
  end
end
