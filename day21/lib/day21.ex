defmodule Day21 do
  def solve1(filename) do
    filename
    |> read_input()
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    filename
    |> File.read!()
    |> String.split("\n", trim: true)
    |> then(fn [player1_string, player2_string] ->
      player1_starting_position = parse(player1_string)
      player2_starting_position = parse(player2_string)

      {player1_starting_position, player2_starting_position}
    end)
  end

  def parse(player_string) do
    String.last(player_string)
    |> String.to_integer()
  end
end
