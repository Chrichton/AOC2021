defmodule Day6 do
  def solve1(filename) do
    filename
    |> read_input()
    |> generate_lantern_fishs(80)
    |> Enum.count()
  end

  def generate_lantern_fishs(lantern_fishs, 0), do: lantern_fishs

  def generate_lantern_fishs(lantern_fishs, generations) do
    next = next_generation(lantern_fishs)

    generate_lantern_fishs(next, generations - 1)
  end

  def next_generation(lantern_fishs) do
    lantern_fishs
    |> Enum.reduce([], fn state, acc ->
      {next_state, spawn_child} = next_state(state)

      if spawn_child,
        do: [8 | [next_state | acc]],
        else: [next_state | acc]
    end)
  end

  def next_state(state) do
    if state == 0,
      do: {6, true},
      else: {state - 1, false}
  end

  def solve2(filename) do
    filename
    |> read_input()
    |> generate_lantern_fishs(256)
    |> Enum.count()
  end

  def read_input(filename) do
    File.read!(filename)
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end
