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
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
