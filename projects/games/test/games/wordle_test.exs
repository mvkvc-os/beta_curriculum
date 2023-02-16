defmodule GamesTest.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle

  describe "feedback/2" do
    test "basic" do
      assert Games.Wordle.feedback("word", "word") == {:ok, [:green, :green, :green, :green]}
      assert Games.Wordle.feedback("word", "wore") == {:ok, [:green, :green, :green, :gray]}
      assert Games.Wordle.feedback("word", "wrdo") == {:ok, [:green, :yellow, :yellow, :yellow]}
    end

    test "errors" do
      assert Games.Wordle.feedback("word", "wrd") ==
               {:error, "Guess must be length 4"}

      assert Games.Wordle.feedback("foolish", "dioosh") ==
               {:error, "Guess must be length 7"}
    end

    test "yellow_count" do
      assert Games.Wordle.feedback("aaabb", "xaaaa") ==
               {:ok, [:gray, :green, :green, :yellow, :gray]}

      assert Games.Wordle.feedback("bbaxa", "xabbb") ==
               {:ok, [:yellow, :yellow, :yellow, :yellow, :gray]}

      assert Games.Wordle.feedback("ababc", "bbabc") ==
               {:ok, [:gray, :green, :green, :green, :green]}
    end
  end
end
