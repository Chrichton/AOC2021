defmodule Day3 do
  def solve1(filename) do
    list =
      filename
      |> read_input()
      |> transpose()

    gamma =
      most_common_bit(list)
      |> Integer.parse(2)
      |> elem(0)

    epsilon =
      least_common_bit(list)
      |> Integer.parse(2)
      |> elem(0)

    gamma * epsilon
  end

  def most_common_bit(list) do
    list
    |> Enum.map(fn binary_list ->
      Enum.frequencies(binary_list)
      |> Enum.max_by(fn {_key, count} -> count end)
    end)
    |> Enum.map(fn {key, _count} -> key end)
    |> Enum.join()
  end

  def least_common_bit(list) do
    list
    |> Enum.map(fn binary_list ->
      Enum.frequencies(binary_list)
      |> Enum.min_by(fn {_key, count} -> count end)
    end)
    |> Enum.map(fn {key, _count} -> key end)
    |> Enum.join()
  end

  def transpose([]), do: []
  def transpose([[] | _]), do: []

  def transpose(a) do
    [Enum.map(a, &hd/1) | transpose(Enum.map(a, &tl/1))]
  end

  def solve2(filename) do
    filename
    |> read_input()
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&String.codepoints/1)
  end
end
