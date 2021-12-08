defmodule Day8 do
  def solve1(filename) do
    filename
    |> read_input()
    |> Enum.flat_map(fn string_list ->
      Enum.map(string_list, fn string ->
        String.length(string)
      end)
    end)
    |> Enum.frequencies()
    |> Enum.filter(fn {number, _count} -> number in [2, 3, 4, 7] end)
    |> Enum.map(fn {_number, count} -> count end)
    |> Enum.sum()
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(fn line ->
      [_left, right] = String.split(line, "|", trim: true)

      String.split(right, " ", trim: true)
    end)
  end
end
