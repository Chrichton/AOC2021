defmodule Day7 do
  def solve1(filename) do
    filename
    |> read_input()
    |> calculate_fuels()
    |> Enum.min_by(fn {_key, count} -> count end)
    |> elem(1)
  end

  def calculate_fuels(crabs) do
    crabs
    |> Enum.uniq()
    |> Enum.reduce([], fn crab_position, acc ->
      fuel = move_all_crabs_to_position(crabs, crab_position)
      [{crab_position, fuel} | acc]
    end)
  end

  def move_all_crabs_to_position(crabs, position) do
    crabs
    |> Enum.reduce(0, fn crab_position, acc ->
      abs(crab_position - position) + acc
    end)
  end

  def solve2(filename) do
    filename
    |> read_input()
    |> calculate_fuels2()
    |> Enum.min_by(fn {_key, count} -> count end)
    |> elem(1)
  end

  def calculate_fuels2(crabs) do
    sorted = Enum.sort(crabs)

    min = hd(sorted)
    max = hd(sorted |> Enum.reverse())
    range = min..max

    range
    |> Enum.map(fn to_position ->
      fuel = move_all_crabs_to_position2(crabs, to_position)
      {to_position, fuel}
    end)
  end

  def move_all_crabs_to_position2(crabs, position) do
    crabs
    |> Enum.reduce(0, fn crab_position, acc ->
      move_crab_from_to(crab_position, position) + acc
    end)
  end

  def move_crab_from_to(from, to) do
    n = abs(from - to)

    n * (n + 1) / 2
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
