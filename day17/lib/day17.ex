defmodule Day17 do
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
    |> String.codepoints()
  end
end
