defmodule Day2 do
  def solve1(filename) do
    {horizonal, depth} =
      filename
      |> read_input()
      |> Enum.reduce({0, 0}, fn [command, value_str], {horizonal, depth} ->
        value = String.to_integer(value_str)

        case command do
          "forward" -> {horizonal + value, depth}
          "up" -> {horizonal, depth - value}
          "down" -> {horizonal, depth + value}
        end
      end)

    horizonal * depth
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
  end
end
