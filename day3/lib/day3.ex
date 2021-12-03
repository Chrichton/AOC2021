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
    list = read_input(filename)

    oxygen_rating =
      find_last_binary_most_common_bit(list, 0)
      |> Enum.join()
      |> Integer.parse(2)
      |> elem(0)

    co2_rating =
      find_last_binary_least_common_bit(list, 0)
      |> Enum.join()
      |> Integer.parse(2)
      |> elem(0)

    oxygen_rating * co2_rating
  end

  def find_last_binary_most_common_bit([result], _index), do: result

  def find_last_binary_most_common_bit(list, index) do
    transposed_list = transpose(list)

    most_common_bit =
      transposed_list
      |> most_common_bit(index)

    new_list =
      list
      |> Enum.filter(&(Enum.at(&1, index) == most_common_bit))

    find_last_binary_most_common_bit(new_list, index + 1)
  end

  def most_common_bit(list, index) do
    frequencies =
      list
      |> Enum.at(index)
      |> Enum.frequencies()

    frequencies
    |> Enum.max_by(fn {_key, count} -> count end, &>/2)
    |> elem(0)
  end

  def find_last_binary_least_common_bit([result], _index), do: result

  def find_last_binary_least_common_bit(list, index) do
    transposed_list = transpose(list)

    least_common_bit =
      transposed_list
      |> least_common_bit(index)

    new_list =
      list
      |> Enum.filter(&(Enum.at(&1, index) == least_common_bit))

    find_last_binary_least_common_bit(new_list, index + 1)
  end

  def least_common_bit(list, index) do
    frequencies =
      list
      |> Enum.at(index)
      |> Enum.frequencies()

    frequencies
    |> Enum.min_by(fn {_key, count} -> count end)
    |> elem(0)
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split("\n")
    |> Enum.map(&String.codepoints/1)
  end
end
